//
//  NSString+Nsstring_Size.m
//  PaiFu
//
//  Created by allenjzl on 2018/3/9.
//  Copyright © 2018年 com.PaiFu. All rights reserved.
//

#import "NSString+Nsstring_Size.h"

@implementation NSString (Nsstring_Size)
/** 测量文本的尺寸 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName: font};
    CGSize size =  [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
    return size;
}
@end
