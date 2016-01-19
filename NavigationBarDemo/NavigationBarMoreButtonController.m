//
//  NavigationBarMoreButtonController.m
//  NavigationBarDemo
//
//  Created by Subo on 16/1/19.
//  Copyright © 2016年 FengFeiYang. All rights reserved.
//

#import "NavigationBarMoreButtonController.h"
#import "UIBarButtonItem+Custom.h"

@interface NavigationBarMoreButtonController ()

@end

@implementation NavigationBarMoreButtonController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"在导航栏上添加多个按钮";
    self.view.backgroundColor = [UIColor whiteColor];
    //注意，如果是在通过navigationController push的 VC，需要通过设置barStyle为UIBarStyleBlack，才会使设置的Status Bar的外观生效
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.11 alpha:1.0];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
#define UserMethod1 0
    
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closeAction)];
    if (UserMethod1) {
        //方法一:
        self.navigationItem.leftBarButtonItems = @[closeItem];
        //要求显示默认的返回按钮，但是文字会显示默认的Back，暂时还不知道这个文字怎么改
        self.navigationItem.leftItemsSupplementBackButton = YES;
    }
    else {
        //方法二
        UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
        leftButton.backgroundColor = [UIColor clearColor];
        leftButton.frame = CGRectMake(0, 0, 45, 40);
        [leftButton setImage:[UIImage imageNamed:@"LeftButton_back_Icon"] forState:UIControlStateNormal];
        [leftButton setTitle:@"返回" forState:UIControlStateNormal];
        leftButton.tintColor = [UIColor whiteColor];
        leftButton.autoresizesSubviews = YES;
        leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        leftButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
        [leftButton addTarget:self action:@selector(goToBack) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        
        self.navigationItem.leftBarButtonItems = @[backItem,closeItem];
    }
}

- (void)closeAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)goToBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    //恢复到默认设置
    self.navigationController.navigationBar.barTintColor = nil;
    self.navigationController.navigationBar.tintColor = nil;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

//设置Status Bar 的外观，使其变成白色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
