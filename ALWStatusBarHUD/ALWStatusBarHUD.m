//
//  WXLStatusBarHUD.m
//  WXLStatusBarHUD
//
//  Created by chejingji on 16/3/3.
//  Copyright © 2016年 AlazyWang. All rights reserved.
//

#import "ALWStatusBarHUD.h"

#define WXLMessageDuration 2.0
#define WXLAnimationDuation 0.25
#define WXLMessageFont [UIFont systemFontOfSize:13.0f]
#define WXLWindowHeight 20
@implementation ALWStatusBarHUD
static UIWindow *window_;
static NSTimer *timer_;

#pragma mark private
/**
 *  加载窗口
 */
+ (void)showWindows
{
    window_ = [[UIWindow alloc]init];
    CGRect frame = [UIScreen mainScreen].bounds;
    frame.origin.y = -WXLWindowHeight;
    frame.size.height = WXLWindowHeight;
    window_.frame = frame;
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
}
/**
 *  加载窗口动画
 */
+(void)loadAnimation
{
    CGRect frame = window_.frame;
    frame.origin.y = 0;
    [UIView animateWithDuration:WXLAnimationDuation animations:^{
        window_.frame = frame;
    }];
}

+ (void)showCommonWithImage:(UIImage*)image msg:(NSString*)msg
{
    [timer_ invalidate];
    [self showWindows];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = window_.bounds;
    [window_ addSubview:btn];
    [btn setTitle:msg forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:WXLMessageFont];
    
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    //定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:WXLMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    [self loadAnimation];
}
/**
 *  显示成功信息
 */
+(void)showSuccess:(NSString *)msg
{
    [self showCommonWithImage:[UIImage imageNamed:@"ALWStatusBarHUD.bundle/success"] msg:msg];
}
/**
 *  显示失败信息
 */
+(void)showError:(NSString *)msg
{
    [self showCommonWithImage:[UIImage imageNamed:@"ALWStatusBarHUD.bundle/error"] msg:msg];
}
/**
 *  显示正在处理的信息
 */
+(void)showLoading:(NSString *)msg
{
    [timer_ invalidate];
    timer_ = nil;
    
    [self showWindows];
    
    //创建lable
    UILabel *lable = [[UILabel alloc]init];
    lable.text = msg;
    lable.textColor = [UIColor whiteColor];
    lable.font = WXLMessageFont;
    lable.textAlignment = NSTextAlignmentCenter;
    CGFloat centreX = window_.frame.size.width/2;
    CGFloat centreY = window_.frame.size.height/2;
    [lable sizeToFit];
    lable.center = CGPointMake(centreX, centreY);
    [window_ addSubview:lable];
    
    // 创建 UIActivityIndicatorView
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]init];
    [activityView sizeToFit];
    CGFloat activityViewX = (window_.frame.size.width - activityView.frame.size.width- lable.frame.size.width)/2-20;
    CGRect activityViewFrame = activityView.frame;
    activityViewFrame.origin.x = activityViewX;
    activityView.frame = activityViewFrame;
    [activityView startAnimating];
    [window_ addSubview:activityView];
    
    [self loadAnimation];
}

/**
 *  显示普通信息
 */
+(void)showMessage:(NSString *)msg
{
    [self showCommonWithImage:nil msg:msg];
}
/**
 *  显示普通信息
 *
 *  @param msg   文字
 *  @param image 图片
 */
+(void)showMessage:(NSString *)msg image:(UIImage *)image
{
    [self showCommonWithImage:image msg:msg];
}

/**
 *  隐藏
 */
+(void)hide
{
    window_.hidden = NO;
    window_ = nil;
}
@end
