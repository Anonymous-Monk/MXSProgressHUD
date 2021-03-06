//
//  RHProgressHUD.h
//  RHBaseModule
//
//  Created by aicai on 2018/7/16.
//  Copyright © 2018年 aicai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "RHProgressHUDDefine.h"

//默认持续显示时间(x秒后消失)
UIKIT_EXTERN CGFloat const delayTime;

/** 设置默认的显示风格(修改这个值可以减少频繁的调用setHudStyle)：
 *  RHHUDContentDefaultStyle = 0,//默认是白底黑字 Default
 *  RHHUDContentBlackStyle = 1,//黑底白字
 *  RHHUDContentCustomStyle = 2,
 *
 * eg：设置为1时，调用任何这个扩展内的方法，显示出hud的UI效果都会为黑底白字风格
 */
#define RHDefaultHudStyle  1

/**
 * 风格为自定义时，在这里设置颜色
 */
#define RHCustomHudStyleBackgrandColor  [UIColor colorWithWhite:0.f alpha:0.7f]
#define RHCustomHudStyleContentColor    [UIColor colorWithWhite:1.f alpha:0.7f]


@interface RHProgressHUD : MBProgressHUD


//*************************************************************************************//
//      所有类方法中有返回本类的，则不会自动消失，返回值为void的都会自动消失(默认值:delayTime)      //
//      所有类方法中有返回本类的，则不会自动消失，返回值为void的都会自动消失(默认值:delayTime)      //
//      所有类方法中有返回本类的，则不会自动消失，返回值为void的都会自动消失(默认值:delayTime)      //
//*************************************************************************************//

/** 在 window 上添加一个只显示文字的 HUD */
+ (void)showMessage:(NSString *)text;

/** 在 view 上添加一个只显示文字的 HUD */
+ (void)showMessage:(NSString *)text view:(UIView *)view;

/** 在 view 上添加一个只显示文字的 HUD 自定义上、中、下 位置*/
+ (void)showMessage:(NSString *)text postion:(RHHUDPostion)postion view:(UIView *)view;

/** 纯文字 + 自定样式 x秒后自动消失*/
+ (void)showMessage:(NSString *)text contentStyle:(RHHUDContentStyle)contentStyle afterDelay:(NSTimeInterval)delay view:(UIView *)view;

/** 在 window 上添加标题、副标题的 HUD*/
+ (void)showDetailMessage:(NSString *)text detail:(NSString *)detail;

/** 在 view 上添加标题、副标题的 HUD */
+ (void)showDetailMessage:(NSString *)text detail:(NSString *)detail view:(UIView *)view;

/** 在 view 上添加标题、副标题的 HUD 自定义上、中、下 位置*/
+ (void)showDetailMessage:(NSString *)text postion:(RHHUDPostion)postion detail:(NSString *)detail view:(UIView *)view;

/** 在 window 上添加一个提示`信息`的 HUD */
+ (void)showInfoMsg:(NSString *)text;

/** 在 view 上添加一个提示`信息`的 HUD */
+ (void)showInfoMsg:(NSString *)text view:(UIView *)view;

/** 在 window 上添加一个提示`成功`的 HUD */
+ (void)showSuccess:(NSString *)text;

/** 在 view 上添加一个提示`成功`的 HUD */
+ (void)showSuccess:(NSString *)text view:(UIView *)view;

/** 在 window 上添加一个提示`失败`的 HUD */
+ (void)showFailure:(NSString *)text;

/** 在 view 上添加一个提示`失败`的 HUD */
+ (void)showFailure:(NSString *)text view:(UIView *)view;

/** 在 window 上添加一个警告`信息`的 HUD */
+ (void)showWarningMsg:(NSString *)text;

/** 在 view 上添加一个警告`信息`的 HUD */
+ (void)showWarningMsg:(NSString *)text view:(UIView *)view;

/** 在 window 显示 loading HUD */
+ (void)showLoading;

/** 在 window 上添加一个显示文字的 loading HUD */
+ (void)showLoading:(NSString *)text;

/** 在 view 上添加一个显示文字的 loading HUD */
+ (void)showLoading:(NSString *)text view:(UIView *)view;

/** 文字 + 自定图片 */
+ (void)showCustomView:(UIImage *)image text:(NSString *)text view:(UIView *)view;



/** 纯文字 + 自定样式 不自动消失 */
+ (RHProgressHUD *)showMessage:(NSString *)text contentStyle:(RHHUDContentStyle)contentStyle view:(UIView *)view;

/** 文字 + 进度条 不自动消失 */
+ (RHProgressHUD *)showDown:(NSString *)text progressStyle:(RHHUDProgressStyle)progressStyle progress:(RHCurrentHud)progress view:(UIView *)view;

/**  文字 + 进度条 + 取消按钮 不自动消失 */
+ (RHProgressHUD *)showDown:(NSString *)text cancelText:(NSString *)cancelText progressStyle:(RHHUDProgressStyle)progressStyle progress:(RHCurrentHud)progress view:(UIView *)view cancelation:(RHCancelation)cancelation;

/**   文字 + 进度 网络请求 不自动消失 */
+ (RHProgressHUD *)showDownNSProgress:(NSString *)text progress:(NSProgress *)progress view:(UIView *)view configHud:(RHCurrentHud)configHud;

/**  文字 + 默认加载图 + 自定朦胧层背景色 不自动消失 */
+ (RHProgressHUD *)showMessage:(NSString *)text backgroundColor:(UIColor *)backgroundColor view:(UIView *)view;

/**  文字 + 默认加载图 + 自定文字、加载图颜色  不自动消失 */
+ (RHProgressHUD *)showMessage:(NSString *)text contentColor:(UIColor *)contentColor view:(UIView *)view;

/**  文字 + 默认加载图 + 自定文图内容颜色 + 自定朦胧层背景色 */
+ (RHProgressHUD *)showMessage:(NSString *)text contentColor:(UIColor *)contentColor backgroundColor:(UIColor *)backgroundColor view:(UIView *)view;

/**  文字 + 默认加载图 + 自定文字及加载图颜色 + 自定朦胧层背景色 */
+ (RHProgressHUD *)showMessage:(NSString *)text textColor:(UIColor *)textColor bezelViewColor:(UIColor *)bezelViewColor backgroundColor:(UIColor *)backgroundColor view:(UIView *)view;

/**  状态变换  配置hud其它属性 */
+ (RHProgressHUD *)createHud:(NSString *)text view:(UIView *)view configHud:(RHCurrentHud)configHud;



/** 隐藏ProgressView */
+ (void)hideHUDForView:(UIView *)view;

/** 隐藏（从window） */
+ (void)hideHUD;

@end
