//
//  NavigationBarChangeBackgroundViewController.m
//  NavigationBarDemo
//
//  Created by Subo on 16/2/19.
//  Copyright © 2016年 FengFeiYang. All rights reserved.
//

#import "NavigationBarChangeBackgroundViewController.h"

@implementation NavigationBarChangeBackgroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGPoint center = self.view.center;
    UIButton *redButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 32)];
    [redButton setTitle:@"Red" forState:UIControlStateNormal];
    [redButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    redButton.layer.borderColor = [UIColor grayColor].CGColor;
    redButton.layer.borderWidth = 1;
    redButton.tag = 1;
    [self.view addSubview:redButton];
    redButton.center = CGPointMake(center.x - 60, center.y);
    
    UIButton *greenButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 32)];
    [greenButton setTitle:@"Green" forState:UIControlStateNormal];
    [greenButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    greenButton.layer.borderColor = [UIColor grayColor].CGColor;
    greenButton.layer.borderWidth = 1;
    greenButton.tag = 2;
    [self.view addSubview:greenButton];
    greenButton.center = CGPointMake(center.x + 60, center.y);
    
    [redButton addTarget:self action:@selector(toucheButton:) forControlEvents:UIControlEventTouchUpInside];
    [greenButton addTarget:self action:@selector(toucheButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //恢复到默认的设置
    self.navigationController.navigationBar.barTintColor = nil;
}

- (IBAction)toucheButton:(UIButton *)sender {
    if (sender.tag == 1) {
        self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    }else {
        self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    }
}

@end
