//
//  UILabel+Factory.h
//  zhuYu
//
//  Created by allenjzl on 2018/5/25.
//  Copyright © 2018年 com.CansLife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Factory)
//实例化lable
+ (instancetype)labelWithFontSize: (CGFloat)fontSize aligement: (NSTextAlignment)aligement numberOfLines: (NSInteger)numberOfLines  textColor: (UIColor *)textColor text: (NSString *)text;


// 自定义行间距
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;
@end
