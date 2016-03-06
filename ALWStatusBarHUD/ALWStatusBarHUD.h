//
//  WXLStatusBarHUD.h
//  WXLStatusBarHUD
//
//  Created by chejingji on 16/3/3.
//  Copyright © 2016年 AlazyWang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ALWStatusBarHUD : NSObject
/**
 *  显示成功信息
 */
+(void)showSuccess:(NSString *)msg;
/**
 *  显示失败信息
 */
+(void)showError:(NSString *)msg;
/**
 *  显示正在处理的信息
 */
+(void)showLoading:(NSString *)msg;

/**
 *  显示普通信息
 */
+(void)showMessage:(NSString *)msg;
/**
 *  显示普通信息
 *
 *  @param msg   文字
 *  @param image 图片
 */
+(void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 *  隐藏
 */
+(void)hide;


@end
