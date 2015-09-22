//
//  NavigationBarBottomLineColorController.m
//  NavigationBarDemo
//
//  Created by subo on 15/9/23.
//  Copyright © 2015年 FengFeiYang. All rights reserved.
//

#import "NavigationBarBottomLineColorController.h"
#import "UIImage+ColorImage.h"

@interface NavigationBarBottomLineColorController ()

@end

@implementation NavigationBarBottomLineColorController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"设置导航栏底部线条的颜色";
    
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    [navigationBar setBackgroundImage:[[UIImage alloc] init]
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    //此处使底部线条颜色为红色
    [navigationBar setShadowImage:[UIImage imageWithColor:[UIColor redColor]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    //恢复到之前的状态
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    [navigationBar setBackgroundImage:nil
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:nil];
}


@end
