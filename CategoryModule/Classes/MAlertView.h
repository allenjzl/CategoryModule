//
//  MAlertView.h
//  yinpubao
//
//  Created by 孟卫东 on 2018/3/16.
//  Copyright © 2018年 yinpubao. All rights reserved.
//

#import <Foundation/Foundation.h>
#define IOS8_OR_LATER ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] != NSOrderedAscending )

typedef void (^ClickBlock)(void);
@interface MAlertView : NSObject<UIAlertViewDelegate>
/**
 *  指定内容不需要回调(只是单纯的显示 )
 */
+(void)alertWithContent:(NSString *)content viewController:(UIViewController *)vc;

/**
 *  指定内容--确定按钮--取消按钮的标题--以及附带回调
 */
+(void) alertWithContent: (NSString *)content viewController: (UIViewController *)vc confirmStr: (NSString *)confirmStr confirmCb: (ClickBlock)confirmCb cancelStr: (NSString *)cancelStr cancelCb: (ClickBlock)cancelCb;

/**
 *  指定内容--确定按钮标题--以及确定按钮点击回调 */
+(void) alertWithContent: (NSString *)content viewController: (UIViewController *)vc confirmStr: (NSString *)confirmStr confirmCb: (ClickBlock)confirmCb;
@end
