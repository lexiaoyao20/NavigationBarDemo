//
//  UIBarButtonItem+Custom.h
//  NavigationBarDemo
//
//  Created by Subo on 16/1/19.
//  Copyright © 2016年 FengFeiYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Custom)

+ (UIBarButtonItem *)barItemWithImage:(UIImage *)image title:(NSString *)title tintColor:(UIColor *)tintColor target:(id)target action:(SEL)action;

+ (UIBarButtonItem*)barItemWithImage:(UIImage*)image title:(NSString*)title target:(id)target action:(SEL)action;

@end
