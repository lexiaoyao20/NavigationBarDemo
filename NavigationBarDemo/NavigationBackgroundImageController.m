//
//  NavigationBackgroundImageController.m
//  NavigationBarDemo
//
//  Created by subo on 15/9/12.
//  Copyright © 2015年 FengFeiYang. All rights reserved.
//

#import "NavigationBackgroundImageController.h"

@interface NavigationBackgroundImageController ()

@end

@implementation NavigationBackgroundImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"设置导航栏的背景图";
    //设置背景图
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Background"]
                                                  forBarMetrics:UIBarMetricsDefault];
    //注意，如果是在通过navigationController push的 VC，需要通过设置barStyle为UIBarStyleBlack，才会使设置的Status Bar的外观生效
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}


- (void)viewWillDisappear:(BOOL)animated {
    //恢复到设置背景图之前的外观
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

//设置Status Bar 的外观，使其变成白色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
