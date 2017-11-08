//
//  CJNoticeView.h
//  CJPopNotice
//
//  Created by 李龙辉 on 2017/11/8.
//  Copyright © 2017年 李龙辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

//箭头位置
typedef NS_ENUM(NSUInteger,CJNoticeDirection) {
    CJNoticeDirectionLeft1=1,//左上
    CJNoticeDirectionLeft2,//左中
    CJNoticeDirectionLeft3,//左下
    CJNoticeDirectionRight1,//右上
    CJNoticeDirectionRight2,//右中
    CJNoticeDirectionRight3,//右下
    CJNoticeDirectionUp1,//上左
    CJNoticeDirectionUp2,//上中
    CJNoticeDirectionUp3,//上右
    CJNoticeDirectionDown1,//下左
    CJNoticeDirectionDown2,//下中
    CJNoticeDirectionDown3,//下右
};

@interface CJNoticeView : UIView

@property (nonatomic, strong) UIView *backView;

/// 初始化
- (instancetype)initWithOrigin:(CGPoint)origin
                         Width:(CGFloat)width
                        Height:(float)height
                     Direction:(CJNoticeDirection)direction;

/// 弹出视图
- (void)popView;

/// 隐藏视图
- (void)dismiss;

@end
