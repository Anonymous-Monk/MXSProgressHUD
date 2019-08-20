//
//  RHProgressHUD.m
//  RHBaseModule
//
//  Created by aicai on 2018/7/16.
//  Copyright © 2018年 aicai. All rights reserved.
//

#import "RHProgressHUD.h"
#import "RHHUDSuccessView.h"
#import <objc/message.h>

CGFloat const delayTime = 1.2;
#define kLoadImage(name) [UIImage imageNamed:[NSString stringWithFormat:@"RHProgressHUD.bundle/%@", (name)]]
#define TEXT_SIZE    16.0f


@implementation RHProgressHUD


NS_INLINE RHProgressHUD *createNew(UIView *view) {
    return [RHProgressHUD showHUDAddedTo:[RHProgressHUD getMainView:view] animated:YES];
}

NS_INLINE RHProgressHUD *settHUD(UIView *view, NSString *title, BOOL autoHidden) {
    RHProgressHUD *hud = createNew(view);
    //文字
    hud.label.text = title;
    //支持多行
    hud.label.numberOfLines = 0;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 动画
    hud.animationType = MBProgressHUDAnimationZoom;
    
    //设置副标题字体大小
    hud.detailsLabel.font = [UIFont boldSystemFontOfSize:TEXT_SIZE];
    
    if (RHDefaultHudStyle == 0) {
        hud.hudContentStyle(RHHUDContentDefaultStyle);
    }
    
    //设置默认风格
    if (RHDefaultHudStyle == 1) {
        hud.hudContentStyle(RHHUDContentBlackStyle);
        hud.tintColor = [UIColor whiteColor];
        
    } else if (RHDefaultHudStyle == 2) {
        hud.hudContentStyle(RHHUDContentCustomStyle);
        hud.tintColor = RHCustomHudStyleContentColor;
    }
    
    if (autoHidden) {
        // x秒之后消失
        [hud hideAnimated:YES afterDelay:delayTime];
    }
    
    
    return hud;
}

+ (UIView *)getMainView:(UIView *)view {
    return (view == nil) ? (UIView*)[UIApplication sharedApplication].delegate.window : view;
}



+ (void)showMessage:(NSString *)text {
    RHProgressHUD *hud = settHUD(nil, text, YES);
    hud.mode = MBProgressHUDModeText;
}

+ (void)showMessage:(NSString *)text view:(UIView *)view {
    RHProgressHUD *hud = settHUD(view, text, YES);
    hud.mode = MBProgressHUDModeText;
}

+ (void)showMessage:(NSString *)text postion:(RHHUDPostion)postion view:(UIView *)view {
    RHProgressHUD *hud = settHUD(view, text, YES);
    hud.mode = MBProgressHUDModeText;
    hud.hudPostion(postion);
}

+ (void)showMessage:(NSString *)text contentStyle:(RHHUDContentStyle)contentStyle afterDelay:(NSTimeInterval)delay view:(UIView *)view {
    RHProgressHUD *hud = settHUD(view, text, NO);
    hud.mode = MBProgressHUDModeText;
    hud.hudContentStyle(contentStyle);
    [hud hideAnimated:YES afterDelay:delay];
}

+ (void)showDetailMessage:(NSString *)text detail:(NSString *)detail {
    RHProgressHUD *hud = settHUD(nil, text, YES);
    hud.detailsLabel.text = detail;
    hud.mode = MBProgressHUDModeText;
}

+ (void)showDetailMessage:(NSString *)text detail:(NSString *)detail view:(UIView *)view {
    RHProgressHUD *hud = settHUD(view, text, YES);
    hud.detailsLabel.text = detail;
    hud.mode = MBProgressHUDModeText;
}

+ (void)showDetailMessage:(NSString *)text postion:(RHHUDPostion)postion detail:(NSString *)detail view:(UIView *)view {
    RHProgressHUD *hud = settHUD(view, text, YES);
    hud.detailsLabel.text = detail;
    hud.mode = MBProgressHUDModeText;
    hud.hudPostion(postion);
}

+  (void)showInfoMsg:(NSString *)text {
    [RHProgressHUD showInfoMsg:text view:nil];
}

+  (void)showInfoMsg:(NSString *)text view:(UIView *)view {
    RHProgressHUD *hud = settHUD(view, text, YES);
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"RH_hud_info@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    //    hud.square = YES;
}

+ (void)showSuccess:(NSString *)text {
    [RHProgressHUD showSuccess:text view:nil];
}

+ (void)showSuccess:(NSString *)text view:(UIView *)view {
    RHHUDSuccessView *suc = [[RHHUDSuccessView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    suc.rh_animationType = RHAnimationTypeSuccess;
    
    suc.translatesAutoresizingMaskIntoConstraints = NO;
    [suc addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[suc(==40)]" options:kNilOptions metrics:nil views:NSDictionaryOfVariableBindings(suc)]];
    [suc addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[suc(==40)]" options:kNilOptions metrics:nil views:NSDictionaryOfVariableBindings(suc)]];
    
    
    RHProgressHUD *hud = settHUD(view, text, YES);
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = suc;
    //    hud.square = YES;
}

+ (void)showFailure:(NSString *)text {
    [RHProgressHUD showFailure:text view:nil];
}

+ (void)showFailure:(NSString *)text view:(UIView *)view {
    RHHUDSuccessView *suc = [[RHHUDSuccessView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    suc.rh_animationType = RHAnimationTypeError;
    
    suc.translatesAutoresizingMaskIntoConstraints = NO;
    [suc addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[suc(==40)]" options:kNilOptions metrics:nil views:NSDictionaryOfVariableBindings(suc)]];
    [suc addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[suc(==40)]" options:kNilOptions metrics:nil views:NSDictionaryOfVariableBindings(suc)]];
    
    RHProgressHUD *hud = settHUD(view, text, YES);
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = suc;
    hud.square = YES;
}

+ (void)showWarningMsg:(NSString *)text {
    [RHProgressHUD showWarningMsg:text view:nil];
}

+ (void)showWarningMsg:(NSString *)text view:(UIView *)view {
    RHProgressHUD *hud = settHUD(view, text, YES);
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"RH_hud_warning.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    hud.square = YES;
}

+ (void)showLoading {
    RHProgressHUD *hud = settHUD(nil, nil, NO);
    hud.square = YES;
}

+ (void)showLoading:(NSString *)text {
    RHProgressHUD *hud = settHUD(nil, text, NO);
    hud.square = YES;
}

+ (void)showLoading:(NSString *)text view:(UIView *)view {
    RHProgressHUD *hud = settHUD(view, text, NO);
    hud.square = YES;
}

+ (void)showCustomView:(UIImage *)image text:(NSString *)text view:(UIView *)view  {
    RHProgressHUD *hud = settHUD(view, text, YES);
    // Set the custom view mode to show any view.
    hud.mode = MBProgressHUDModeCustomView;
    // Set an image view with a checkmark.
    hud.customView = [[UIImageView alloc] initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    // Looks a bit nicer if we make it square.
    hud.square = YES;
}




+ (RHProgressHUD *)showMessage:(NSString *)text contentStyle:(RHHUDContentStyle)contentStyle view:(UIView *)view {
    RHProgressHUD *hud = settHUD(view, text, NO);
    hud.mode = MBProgressHUDModeText;
    hud.hudContentStyle(contentStyle);
    return hud;
}

+ (RHProgressHUD *)showDown:(NSString *)text progressStyle:(RHHUDProgressStyle)progressStyle progress:(RHCurrentHud)progress view:(UIView *)view {
    RHProgressHUD *hud = settHUD(view, text, NO);
    if (progressStyle == RHHUDProgressStyleDeterminateHorizontalBar) {
        hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
        
    } else if (progressStyle == RHHUDProgressStyleDeterminate) {
        hud.mode = MBProgressHUDModeDeterminate;
        
    } else if (progressStyle == RHHUDProgressStyleAnnularDeterminate) {
        hud.mode = MBProgressHUDModeAnnularDeterminate;
    }
    if (progress) {
        progress(hud);
    }
    return hud;
}


+ (RHProgressHUD *)showDown:(NSString *)text cancelText:(NSString *)cancelText progressStyle:(RHHUDProgressStyle)progressStyle progress:(RHCurrentHud)progress view:(UIView *)view cancelation:(RHCancelation)cancelation  {
    RHProgressHUD *hud = settHUD(view, text, NO);
    
    if (progressStyle == RHHUDProgressStyleDeterminateHorizontalBar) {
        hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
        
    } else if (progressStyle == RHHUDProgressStyleDeterminate) {
        hud.mode = MBProgressHUDModeDeterminate;
        
    } else if (progressStyle == RHHUDProgressStyleAnnularDeterminate) {
        hud.mode = MBProgressHUDModeAnnularDeterminate;
    }
    
    [hud.button setTitle:cancelText ?: NSLocalizedString(@"Cancel", @"HUD cancel button title") forState:UIControlStateNormal];
    [hud.button addTarget:hud action:@selector(didClickCancelButton) forControlEvents:UIControlEventTouchUpInside];
    hud.cancelation = cancelation;
    if (progress) {
        progress(hud);
    }
    return hud;
}

+ (RHProgressHUD *)showDownNSProgress:(NSString *)text progress:(NSProgress *)progress view:(UIView *)view configHud:(RHCurrentHud)configHud {
    RHProgressHUD *hud = settHUD(view, text, NO);
    if (configHud) {
        configHud(hud);
    }
    return hud;
}

+ (RHProgressHUD *)showMessage:(NSString *)text backgroundColor:(UIColor *)backgroundColor view:(UIView *)view {
    RHProgressHUD *hud = settHUD(view, text, NO);
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.backgroundColor = backgroundColor;
    return hud;
}

+ (RHProgressHUD *)showMessage:(NSString *)text contentColor:(UIColor *)contentColor view:(UIView *)view {
    RHProgressHUD *hud = settHUD(view, text, NO);
    hud.contentColor = contentColor;
    return hud;
}

+ (RHProgressHUD *)showMessage:(NSString *)text contentColor:(UIColor *)contentColor backgroundColor:(UIColor *)backgroundColor view:(UIView *)view {
    RHProgressHUD *hud = settHUD(view, text, NO);
    hud.contentColor = contentColor;
    hud.backgroundView.color = backgroundColor;
    return hud;
}

+ (RHProgressHUD *)showMessage:(NSString *)text textColor:(UIColor *)textColor bezelViewColor:(UIColor *)bezelViewColor backgroundColor:(UIColor *)backgroundColor view:(UIView *)view {
    RHProgressHUD *hud = settHUD(view, text, NO);
    hud.label.textColor = textColor;
    hud.bezelView.backgroundColor = bezelViewColor;
    hud.backgroundView.color = backgroundColor;
    return hud;
}

+ (RHProgressHUD *)createHud:(NSString *)text view:(UIView *)view configHud:(RHCurrentHud)configHud {
    RHProgressHUD *hud = settHUD(view, text, YES);
    if (configHud) {
        configHud(hud);
    }
    return hud;
}


+ (void)hideHUDForView:(UIView *)view {
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:view animated:YES];
}


+ (void)hideHUD {
    [self hideHUDForView:nil];
}


#pragma mark -- sett // gett
- (void)didClickCancelButton {
    if (self.cancelation) {
        self.cancelation(self);
    }
}

@end




#pragma mark -- MBProgressHUD延展

@implementation MBProgressHUD(RHExtension)

- (void)setCancelation:(RHCancelation)cancelation {
    objc_setAssociatedObject(self, @selector(cancelation), cancelation, OBJC_ASSOCIATION_COPY);
}

- (RHCancelation)cancelation {
    return objc_getAssociatedObject(self, _cmd);
}

- (MBProgressHUD *(^)(UIColor *))hudBackgroundColor {
    return ^(UIColor *hudBackgroundColor) {
        self.backgroundView.color = hudBackgroundColor;
        return self;
    };
}

- (MBProgressHUD *(^)(UIView *))toView {
    return ^(UIView *view){
        return self;
    };
}

- (MBProgressHUD *(^)(NSString *))title {
    return ^(NSString *title){
        self.label.text = title;
        return self;
    };
}

- (MBProgressHUD *(^)(NSString *))details {
    return ^(NSString *details){
        self.detailsLabel.text = details;
        return self;
    };
}

- (MBProgressHUD *(^)(NSString *))customIcon {
    return ^(NSString *customIcon) {
        self.customView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:customIcon] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        return self;
    };
}

- (MBProgressHUD *(^)(UIColor *))titleColor {
    return ^(UIColor *titleColor){
        self.label.textColor = titleColor;
        self.detailsLabel.textColor = titleColor;
        return self;
    };
}

- (MBProgressHUD *(^)(UIColor *))progressColor {
    return ^(UIColor *progressColor) {
        UIColor *titleColor = self.label.textColor;
        self.contentColor = progressColor;
        self.label.textColor = titleColor;
        self.detailsLabel.textColor = titleColor;
        return self;
    };
}

- (MBProgressHUD *(^)(UIColor *))allContentColors {
    return ^(UIColor *allContentColors) {
        self.contentColor = allContentColors;
        return self;
    };
}


- (MBProgressHUD *(^)(UIColor *))bezelBackgroundColor {
    return ^(UIColor *bezelViewColor){
        self.bezelView.backgroundColor = bezelViewColor;
        return self;
    };
}



- (MBProgressHUD *(^)(RHHUDContentStyle))hudContentStyle {
    return ^(RHHUDContentStyle hudContentStyle){
        if (hudContentStyle == RHHUDContentBlackStyle) {
            self.contentColor = [UIColor whiteColor];
            self.tintColor = [UIColor whiteColor];
            self.bezelView.backgroundColor = [UIColor blackColor];
            self.bezelView.style = MBProgressHUDBackgroundStyleBlur;
            
        } else if (hudContentStyle == RHHUDContentCustomStyle) {
            self.contentColor = RHCustomHudStyleContentColor;
            self.tintColor = RHCustomHudStyleContentColor;
            self.bezelView.backgroundColor = RHCustomHudStyleBackgrandColor;
            self.bezelView.style = MBProgressHUDBackgroundStyleBlur;
            
        } else if (hudContentStyle == RHHUDContentDefaultStyle){
            self.contentColor = [UIColor blackColor];
            self.tintColor = [UIColor blackColor];
            self.bezelView.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
            self.bezelView.style = MBProgressHUDBackgroundStyleBlur;
            
        }
        return self;
    };
}


- (MBProgressHUD *(^)(RHHUDPostion))hudPostion {
    return ^(RHHUDPostion hudPostion){
        if (hudPostion == RHHUDPostionTop) {
            self.offset = CGPointMake(0.f, -MBProgressMaxOffset);
        } else if (hudPostion == RHHUDPostionCenten) {
            self.offset = CGPointMake(0.f, 0.f);
        } else {
            self.offset = CGPointMake(0.f, MBProgressMaxOffset);
        }
        return self;
    };
}

- (MBProgressHUD *(^)(RHHUDProgressStyle))hudProgressStyle {
    return ^(RHHUDProgressStyle hudProgressStyle){
        if (hudProgressStyle == RHHUDProgressStyleDeterminate) {
            self.mode = MBProgressHUDModeDeterminate;
            
        } else if (hudProgressStyle == RHHUDProgressStyleAnnularDeterminate) {
            self.mode = MBProgressHUDModeAnnularDeterminate;
            
        } else if (hudProgressStyle == RHHUDProgressStyleCancelationDeterminate) {
            self.mode = MBProgressHUDModeDeterminate;
            
        } else if (hudProgressStyle == RHHUDProgressStyleDeterminateHorizontalBar) {
            self.mode = MBProgressHUDModeDeterminateHorizontalBar;
            
        }
        return self;
    };
}

@end
