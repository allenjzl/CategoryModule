//
//  UIButton+Factory.h
//  zhuYu
//
//  Created by allenjzl on 2018/5/25.
//  Copyright © 2018年 com.CansLife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Factory)
+ (instancetype)buttonWithTitle: (NSString *)title fontSize:(CGFloat)fontSize titleColor: (UIColor *)titleColor backgroundColor: (UIColor *)backgroundColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth cornerRadius: (CGFloat )cornerRadius;
+ (instancetype)buttonWithTitle: (NSString *)title fontSize:(CGFloat)fontSize titleColor: (UIColor *)titleColor backgroundColor: (UIColor *)backgroundColor ;
+ (instancetype)buttonWithTitle: (NSString *)title fontSize:(CGFloat)fontSize titleColor: (UIColor *)titleColor backgroundColor: (UIColor *)backgroundColor cornerRadius: (CGFloat )cornerRadius;
@end
