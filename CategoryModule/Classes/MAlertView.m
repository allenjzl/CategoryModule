//
//  MAlertView.m
//  yinpubao
//
//  Created by 孟卫东 on 2018/3/16.
//  Copyright © 2018年 yinpubao. All rights reserved.
//

#import "MAlertView.h"
@interface MAlertView ()
/**
 *  标题
 */
@property(nonatomic , strong)NSString *title;
@end
@implementation MAlertView
{
    ClickBlock _confirmCb;
    ClickBlock _cancelCb;
}

static  MAlertView*_alert;


+(void)sharedAlertView {
    if (_alert == nil) {
        _alert = [[MAlertView alloc] init];
        _alert.title = @"温馨提示";
    }
}



/**
 *  指定内容  不需要回调
 */
+(void)alertWithContent:(NSString *)content viewController:(UIViewController *)vc
{
    [MAlertView sharedAlertView];
    [_alert alertWithContent:content viewController:vc confirmString:@"确定" confirmBlock:nil cancelString:nil cancelBlock:nil];
}

/**
 *  指定内容--确定按钮--取消按钮的标题--以及附带回调
 */
+(void) alertWithContent: (NSString *)content viewController: (UIViewController *)vc confirmStr: (NSString *)confirmStr confirmCb: (ClickBlock)confirmCb cancelStr: (NSString *)cancelStr cancelCb: (ClickBlock)cancelCb
{
    [MAlertView sharedAlertView];
    [_alert alertWithContent:content viewController:vc confirmString:confirmStr confirmBlock:confirmCb cancelString:cancelStr cancelBlock:cancelCb];
    
}

/**
 *  指定内容、确定按钮标题以及点击回调 */
+(void) alertWithContent: (NSString *)content viewController: (UIViewController *)vc confirmStr: (NSString *)confirmStr confirmCb: (ClickBlock)confirmCb
{
    [MAlertView sharedAlertView];
    [_alert alertWithContent:content viewController:vc confirmString:confirmStr confirmBlock:confirmCb cancelString:nil cancelBlock:nil];
}

#pragma 方法内部统一调用的方法
-(void) alertWithContent: (NSString *) content viewController: (UIViewController *) vc confirmString: (NSString *) confirmString confirmBlock: (ClickBlock) confirmBlock cancelString: (NSString *) cancelString cancelBlock: (ClickBlock) cancelBlock {
    
    _confirmCb = confirmBlock;
    _cancelCb = cancelBlock;
    
    if (IOS8_OR_LATER) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:self.title message:content preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmString style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [alertController dismissViewControllerAnimated:YES completion:nil];
            if (_confirmCb != nil) {
                _confirmCb();
            }
        }];
        [alertController addAction:confirmAction];
        
        if (cancelString != nil) {
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelString style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                [alertController dismissViewControllerAnimated:YES completion:nil];
                if (_cancelCb != nil) {
                    _cancelCb();
                }
            }];
            [alertController addAction:cancelAction];
        }
        
        [vc presentViewController:alertController animated:YES completion:nil];
        
    }
    else//如果是ios8之前
    {
        UIAlertView *alertView;
        if (cancelString == nil) {
            alertView = [[UIAlertView alloc] initWithTitle:self.title message:content delegate:self cancelButtonTitle:confirmString otherButtonTitles:nil, nil];
            //            [self willPresentAlertView:alertView];
        }
        else
        {
            alertView = [[UIAlertView alloc] initWithTitle:self.title message:content delegate:self cancelButtonTitle:cancelString otherButtonTitles: confirmString, nil];
            //            [self willPresentAlertView:alertView];
        }
        
        _confirmCb = confirmBlock ? confirmBlock : nil;
        _cancelCb = cancelBlock ? cancelBlock : nil;
        [alertView show];
    }
}

- (void)willPresentAlertView:(UIAlertView *)alertView
{
    
    for( UIView * view in alertView.subviews )
    {
        if( [view isKindOfClass:[UILabel class]] )
        {
            UILabel* label = (UILabel*) view;
            label.textAlignment = NSTextAlignmentLeft;
            
        }
    }
}

#pragma 系统内部的方法  点击按钮 通过tag值进行相应操作
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0 && _cancelCb != nil) {
        _cancelCb();
    }else if (buttonIndex == 0 && _confirmCb != nil && _cancelCb == nil){
        _confirmCb();
    }
    else if (buttonIndex == 1 && _confirmCb != nil)
    {
        _confirmCb();
    }
}
@end
