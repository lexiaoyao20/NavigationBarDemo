//
//  ViewController.m
//  NavigationBarDemo
//
//  Created by subo on 15/9/11.
//  Copyright © 2015年 FengFeiYang. All rights reserved.
//

#import "ViewController.h"
#import "NavigationBarBackgroundViewController.h"
#import "NavigationBackgroundImageController.h"
#import "NavigationBarWithBackButtonController.h"


@interface FMTestModel : NSObject

@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *className;

@end

@implementation FMTestModel


@end


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak,nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置UINavigationBar的标题
    self.navigationItem.title = @"UINavigationBar使用总结";
    
    [self loadData];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData {
    self.dataArray = [[NSMutableArray alloc] init];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DataSource" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    for (NSDictionary *dict in array) {
        FMTestModel *model = [[FMTestModel alloc] init];
        model.title = [dict objectForKey:@"Title"];
        model.className = [dict objectForKey:@"ClassName"];
        [self.dataArray addObject:model];
    }
}

#pragma mark -
#pragma mark .....:::::: TableView DataSource ::::::.....

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    FMTestModel *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.title;
    
    return cell;
}

#pragma mark -
#pragma mark .....:::::: TableView Delegate ::::::.....

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    FMTestModel *model = self.dataArray[indexPath.row];
    UIViewController *viewController = [[NSClassFromString(model.className) alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
