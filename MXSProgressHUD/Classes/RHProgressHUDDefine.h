//
//  RHProgressHUDDefine.h
//  RHBaseModule
//
//  Created by aicai on 2018/7/16.
//  Copyright © 2018年 aicai. All rights reserved.
//

#import "RHProgressHUD.h"

typedef NS_ENUM(NSInteger, RHHUDContentStyle) {
    RHHUDContentDefaultStyle = 0,//默认是白底黑字 Default
    RHHUDContentBlackStyle = 1,//黑底白字
    RHHUDContentCustomStyle = 2,//:自定义风格<由自己设置自定义风格的颜色>
};

typedef NS_ENUM(NSInteger, RHHUDPostion) {
    RHHUDPostionTop,//上面
    RHHUDPostionCenten,//中间
    RHHUDPostionBottom,//下面
};

typedef NS_ENUM(NSInteger, RHHUDProgressStyle) {
    RHHUDProgressStyleDeterminate,//开扇型加载进度
    RHHUDProgressStyleDeterminateHorizontalBar,//横条加载进度
    RHHUDProgressStyleAnnularDeterminate,//环形加载进度
    RHHUDProgressStyleCancelationDeterminate//带取消按钮 - 开扇型加载进度
};

typedef void((^RHCancelation)(MBProgressHUD *hud));
typedef void((^RHCurrentHud)(MBProgressHUD *hud));

@interface MBProgressHUD (RHExtension)

@property (nonatomic, copy  ) RHCancelation cancelation;
///内容风格
@property (nonatomic, assign, readonly) MBProgressHUD *(^hudContentStyle)(RHHUDContentStyle hudContentStyle);
///显示位置：有导航栏时在导航栏下在，无导航栏在状态栏下面
@property (nonatomic, assign, readonly) MBProgressHUD *(^hudPostion)(RHHUDPostion hudPostion);
///进度条风格
@property (nonatomic, assign, readonly) MBProgressHUD *(^hudProgressStyle)(RHHUDProgressStyle hudProgressStyle);
///标题
@property (nonatomic, copy  , readonly) MBProgressHUD *(^title)(NSString *title);
///详情
@property (nonatomic, copy  , readonly) MBProgressHUD *(^details)(NSString *details);
///自定义图片名
@property (nonatomic, copy  , readonly) MBProgressHUD *(^customIcon)(NSString *customIcon);
///标题颜色
@property (nonatomic, strong, readonly) MBProgressHUD *(^titleColor)(UIColor *titleColor);
///进度条颜色
@property (nonatomic, strong, readonly) MBProgressHUD *(^progressColor)(UIColor *progressColor);
///进度条、标题颜色
@property (nonatomic, strong, readonly) MBProgressHUD *(^allContentColors)(UIColor *allContentColors);
///蒙层背景色
@property (nonatomic, strong, readonly) MBProgressHUD *(^hudBackgroundColor)(UIColor *backgroundColor);
///内容背景色
@property (nonatomic, strong, readonly) MBProgressHUD *(^bezelBackgroundColor)(UIColor *bezelBackgroundColor);


@end
