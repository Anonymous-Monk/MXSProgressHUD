//
//  RHHUDSuccessView.h
//  RHBaseModule
//
//  Created by aicai on 2018/7/16.
//  Copyright © 2018年 aicai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RHAnimationType) {
    RHAnimationTypeNone,
    /* 成功 */
    RHAnimationTypeSuccess,
    /* 失败 */
    RHAnimationTypeError,
};


@interface RHHUDSuccessView : UIView<CAAnimationDelegate>

/**
 *  操作成功还是失败类型的动画
 */
@property(nonatomic, assign) RHAnimationType rh_animationType;

@end

NS_ASSUME_NONNULL_END
