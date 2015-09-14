//
//  NavigationBarWithBackButtonController.m
//  NavigationBarDemo
//
//  Created by subo on 15/9/15.
//  Copyright (c) 2015年 FengFeiYang. All rights reserved.
//

#import "NavigationBarWithBackButtonController.h"

@interface NavigationBarWithBackButtonController ()

@end

@implementation NavigationBarWithBackButtonController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"设置导航栏的返回按钮";
    //设置背景图
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Background"]
                                                  forBarMetrics:UIBarMetricsDefault];
    //注意，如果是在通过navigationController push的 VC，需要通过设置barStyle为UIBarStyleBlack，才会使设置的Status Bar的外观生效
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
//    [self setBackButtonWithColor];
//    [self setBackButtonWithImage];
//    [self setBackButtonTitle];
    [self setCustomLeftButton];
    //修复navigationController侧滑关闭失效的问题
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}


/****************************
 * 下面为设置返回按钮的几种方式
 ********************************/

- (void)setBackButtonWithColor {
    //设置按钮的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)goToBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setBackButtonWithImage {
    UIImage *leftButtonIcon = [[UIImage imageNamed:@"LeftButton_back_Icon"]
                               imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonIcon
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(goToBack)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    //修复navigationController侧滑关闭失效的问题
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}

- (void)setBackButtonTitle {
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"取消", nil)
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self action:@selector(goToBack)];
    leftButton.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)setCustomLeftButton {
    UIView* leftButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.backgroundColor = [UIColor clearColor];
    leftButton.frame = leftButtonView.frame;
    [leftButton setImage:[UIImage imageNamed:@"LeftButton_back_Icon"] forState:UIControlStateNormal];
    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    leftButton.tintColor = [UIColor redColor];
    leftButton.autoresizesSubviews = YES;
    leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
    [leftButton addTarget:self action:@selector(goToBack) forControlEvents:UIControlEventTouchUpInside];
    [leftButtonView addSubview:leftButton];
    UIBarButtonItem* leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:leftButtonView];
    self.navigationItem.leftBarButtonItem = leftBarButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    //恢复到设置背景图之前的外观
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.tintColor = nil;
}

//设置Status Bar 的外观，使其变成白色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
