//
//  UIButton+Factory.m
//  zhuYu
//
//  Created by allenjzl on 2018/5/25.
//  Copyright © 2018年 com.CansLife. All rights reserved.
//

#import "UIButton+Factory.h"

@implementation UIButton (Factory)
+ (instancetype)buttonWithTitle: (NSString *)title fontSize:(CGFloat)fontSize titleColor: (UIColor *)titleColor backgroundColor: (UIColor *)backgroundColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth cornerRadius: (CGFloat )cornerRadius {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.backgroundColor = backgroundColor;
    if (borderColor != nil) {
        button.layer.borderColor = borderColor.CGColor;
    }
    button.layer.borderWidth = borderWidth;
    button.clipsToBounds = YES;
    button.layer.cornerRadius = cornerRadius;
    return button;
}

+ (instancetype)buttonWithTitle: (NSString *)title fontSize:(CGFloat)fontSize titleColor: (UIColor *)titleColor backgroundColor: (UIColor *)backgroundColor  {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.adjustsImageWhenHighlighted = NO;
    button.backgroundColor = backgroundColor;
    return button;
}

+ (instancetype)buttonWithTitle: (NSString *)title fontSize:(CGFloat)fontSize titleColor: (UIColor *)titleColor backgroundColor: (UIColor *)backgroundColor cornerRadius: (CGFloat )cornerRadius  {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.adjustsImageWhenHighlighted = NO;
    button.backgroundColor = backgroundColor;
    button.clipsToBounds = YES;
    button.layer.cornerRadius = cornerRadius;
    return button;
}
@end
