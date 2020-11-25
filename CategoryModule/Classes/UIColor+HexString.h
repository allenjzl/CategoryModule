//
//  UIColor+HexString.h
//  GymLink
//
//  Created by 张艺龙 on 2017/3/14.
//  Copyright © 2017年 张艺龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexString)

// 使用十六进制颜色值
+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end
