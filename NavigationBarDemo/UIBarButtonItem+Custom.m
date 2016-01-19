//
//  UIBarButtonItem+Custom.m
//  NavigationBarDemo
//
//  Created by Subo on 16/1/19.
//  Copyright © 2016年 FengFeiYang. All rights reserved.
//

#import "UIBarButtonItem+Custom.h"

@implementation UIBarButtonItem (Custom)

+ (UIBarButtonItem *)barItemWithImage:(UIImage *)image title:(NSString *)title tintColor:(UIColor *)tintColor target:(id)target action:(SEL)action {
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setFrame:CGRectMake(0, 0, 60, 20.5f)];
    image = [self image:image tintedWithColor:tintColor fraction:0.0];
    
    // setting the image for both states
    [backButton setBackgroundImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.width, image.size.height, image.size.width, image.size.height)] forState:UIControlStateNormal];
    [backButton setBackgroundImage:[[self image:image byApplyingAlpha:0.3] resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.width, image.size.height, image.size.width, image.size.height)] forState:UIControlStateHighlighted];
    
    [backButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [backButton setTitle:title forState:UIControlStateNormal];
    
    backButton.tintColor = tintColor;
    
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [backButtonItem setTitle:title];
    
    return backButtonItem;
}

+ (UIBarButtonItem*)barItemWithImage:(UIImage*)image title:(NSString*)title target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.0, 0.0, image.size.width, image.size.height);
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    barButtonItem.title = title;
    
    return barButtonItem ;
}



+ (UIImage *)image:(UIImage *)image byApplyingAlpha:(CGFloat) alpha {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -rect.size.height);
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    CGContextSetAlpha(ctx, alpha);
    CGContextDrawImage(ctx, rect, image.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)image:(UIImage *)image tintedWithColor:(UIColor *)color fraction:(CGFloat)fraction
{
    if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    } else {
        UIGraphicsBeginImageContext([image size]);
    }
    CGRect rect = CGRectZero;
    rect.size = image.size;
    [color set];
    UIRectFill(rect);
    [image drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1.0];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
