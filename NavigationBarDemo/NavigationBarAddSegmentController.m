//
//  NavigationBarAddSegmentController.m
//  NavigationBarDemo
//
//  Created by Subo on 16/1/19.
//  Copyright © 2016年 FengFeiYang. All rights reserved.
//

#import "NavigationBarAddSegmentController.h"

@interface NavigationBarAddSegmentController ()

@end

@implementation NavigationBarAddSegmentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UISegmentedControl *segControl = [[UISegmentedControl alloc] initWithItems:@[@"消息",@"电话"]];
    segControl.tintColor = [UIColor colorWithRed:0.07 green:0.72 blue:0.96 alpha:1];
    [segControl setSelectedSegmentIndex:0];
    self.navigationItem.titleView = segControl;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
