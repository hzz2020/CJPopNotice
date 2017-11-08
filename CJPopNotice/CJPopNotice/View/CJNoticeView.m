//
//  CJNoticeView.m
//  CJPopNotice
//
//  Created by 李龙辉 on 2017/11/8.
//  Copyright © 2017年 李龙辉. All rights reserved.
//

#import "CJNoticeView.h"
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface CJNoticeView ()

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) CJNoticeDirection direction;

@end

@implementation CJNoticeView

- (instancetype)initWithOrigin:(CGPoint)origin Width:(CGFloat)width Height:(float)height Direction:(CJNoticeDirection)direction {
    if (self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)]) {
        //背景颜色为无色
        self.backgroundColor=[UIColor clearColor];
        //定义显示视图的参数
        self.origin = origin;
        self.height = height;
        self.width = width;
        self.direction = direction;
        
        self.backView = [[UIView alloc] initWithFrame:CGRectMake(origin.x, origin.y, width, height)];
        self.backView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1];
        [self addSubview:self.backView];
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect {
    CGContextRef context=UIGraphicsGetCurrentContext();
    if (_direction==CJNoticeDirectionLeft1) {
        CGFloat startX = self.origin.x;
        CGFloat startY = self.origin.y;
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX+5, startY-5);
        CGContextAddLineToPoint(context, startX+5, startY+5);
    } else if (_direction==CJNoticeDirectionLeft2) {
        CGFloat startX = self.origin.x;
        CGFloat startY = self.origin.y;
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX+5, startY-5);
        CGContextAddLineToPoint(context, startX+5, startY+5);
    } else if (_direction==CJNoticeDirectionLeft3) {
        CGFloat startX = self.origin.x;
        CGFloat startY = self.origin.y;
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX+5, startY-5);
        CGContextAddLineToPoint(context, startX+5, startY+5);
    } else if (_direction==CJNoticeDirectionRight1) {
        CGFloat startX = self.origin.x;
        CGFloat startY = self.origin.y;
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX-5, startY-5);
        CGContextAddLineToPoint(context, startX-5, startY+5);
    } else if (_direction==CJNoticeDirectionRight2) {
        CGFloat startX = self.origin.x;
        CGFloat startY = self.origin.y;
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX-5, startY-5);
        CGContextAddLineToPoint(context, startX-5, startY+5);
    } else if (_direction==CJNoticeDirectionRight3) {
        CGFloat startX = self.origin.x;
        CGFloat startY = self.origin.y;
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX-5, startY-5);
        CGContextAddLineToPoint(context, startX-5, startY+5);
    } else if (_direction==CJNoticeDirectionUp1) {
        CGFloat startX = self.origin.x;
        CGFloat startY = self.origin.y;
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX + 5, startY +5);
        CGContextAddLineToPoint(context, startX -5, startY+5);
    } else if (_direction==CJNoticeDirectionUp2) {
        CGFloat startX = self.origin.x;
        CGFloat startY = self.origin.y;
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX + 5, startY +5);
        CGContextAddLineToPoint(context, startX -5, startY+5);
    } else if (_direction==CJNoticeDirectionUp3) {
        CGFloat startX = self.origin.x;
        CGFloat startY = self.origin.y;
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX + 5, startY +5);
        CGContextAddLineToPoint(context, startX -5, startY+5);
    } else if (_direction==CJNoticeDirectionDown1) {
        CGFloat startX = self.origin.x;
        CGFloat startY = self.origin.y;
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX - 5, startY -5);
        CGContextAddLineToPoint(context, startX +5, startY-5);
    } else if (_direction==CJNoticeDirectionDown2) {
        CGFloat startX = self.origin.x;
        CGFloat startY = self.origin.y;
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX - 5, startY -5);
        CGContextAddLineToPoint(context, startX +5, startY-5);
    } else if (_direction==CJNoticeDirectionDown3) {
        CGFloat startX = self.origin.x;
        CGFloat startY = self.origin.y;
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX - 5, startY -5);
        CGContextAddLineToPoint(context, startX +5, startY-5);
    }
    
    CGContextClosePath(context);
    [self.backView.backgroundColor setFill];
    [self.backgroundColor setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (![touch.view isEqual:self.backView]) {
        [self dismiss];
    }
}

/// 弹出视图
-(void)popView {
    NSArray *result=[self.backView subviews];
    for (UIView *view in result) {
        view.hidden=YES;
    }
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:self];
    //动画效果弹出
    self.alpha = 0;
    
    if (_direction==CJNoticeDirectionLeft1) {
        self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y-20, self.width,self. height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    } else if (_direction==CJNoticeDirectionLeft2) {
        self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y-self.height/2, self.width,self. height);
        } completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    } else if (_direction==CJNoticeDirectionLeft3) {
        self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y-self.height+20, self.width,self. height);
        } completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    } else if (_direction==CJNoticeDirectionRight1) {
        self.backView.frame = CGRectMake(self.origin.x-5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x-5, self.origin.y-20, -self.width,self. height);
        } completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    } else if (_direction==CJNoticeDirectionRight2) {
        self.backView.frame = CGRectMake(self.origin.x-5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x-5, self.origin.y-self.height/2, -self.width,self. height);
        } completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    } else if (_direction==CJNoticeDirectionRight3) {
        self.backView.frame = CGRectMake(self.origin.x-5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x-5, self.origin.y-self.height+20, -self.width,self. height);
        } completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    } else if (_direction==CJNoticeDirectionUp1) {
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y+5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x-20, self.origin.y+5, self.width,self. height);
        } completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    } else if (_direction==CJNoticeDirectionUp2) {
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y+5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x-self.width/2, self.origin.y+5, self.width,self. height);
        } completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    } else if (_direction==CJNoticeDirectionUp3) {
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y+5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x+20, self.origin.y+5, -self.width,self. height);
        } completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    } else if (_direction==CJNoticeDirectionDown1) {
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y-5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x-20, self.origin.y-5, self.width,-self. height);
        } completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    } else if (_direction==CJNoticeDirectionDown2) {
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y-5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x-self.width/2, self.origin.y-5, self.width,-self. height);
        } completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    } else if (_direction==CJNoticeDirectionDown3) {
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y-5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x-self.width+20, self.origin.y-5, self.width,-self. height);
        } completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }
}

/// 隐藏视图
- (void)dismiss {
    NSArray *result=[self.backView subviews];
    for (UIView *view in result) {
        [view removeFromSuperview];
    }
    //动画效果淡出
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y, 0, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

@end
