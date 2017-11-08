//
//  ViewController.m
//  CJPopNotice
//
//  Created by 李龙辉 on 2017/11/8.
//  Copyright © 2017年 李龙辉. All rights reserved.
//

#import "ViewController.h"
#import "CJNoticeView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
    
- (IBAction)buttonClick:(id)sender {
    /// 箭头点的位置
    CGPoint pointButton = CGPointMake(_button.frame.origin.x,
                                      _button.frame.origin.y+_button.frame.size.height);
    /// 初始化弹出视图的箭头顶点位置point，展示视图的宽度Width，高度Height，Direction以及展示的方向
    CJNoticeView *viewButton = [[CJNoticeView alloc] initWithOrigin:pointButton
                                                        Width:200
                                                       Height:40
                                                    Direction:CJNoticeDirectionUp1];
    
    UILabel *labelButton=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 180, 30)];
    labelButton.text = @"button测试";
    labelButton.textColor = [UIColor whiteColor];
    [viewButton.backView addSubview:labelButton];
    [viewButton popView];
    ///// textfield
    CGPoint pointTextField = CGPointMake(_textField.frame.origin.x+_textField.frame.size.width/2,
                                         _textField.frame.origin.y+_textField.frame.size.height);
    CJNoticeView *viewTextField = [[CJNoticeView alloc] initWithOrigin:pointTextField
                                                                 Width:200
                                                                Height:40
                                                             Direction:CJNoticeDirectionUp2];
    
    UILabel *labelTextField = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 180, 30)];
    labelTextField.text = @"TextField测试";
    labelTextField.textColor = [UIColor whiteColor];
    [viewTextField.backView addSubview:labelTextField];
    [viewTextField popView];
    
    ///// imageView
    CGPoint pointImageView = CGPointMake(_imageView.frame.origin.x+_imageView.frame.size.width,
                                         _imageView.frame.origin.y+_imageView.frame.size.height);
    CJNoticeView *viewImageView = [[CJNoticeView alloc] initWithOrigin:pointImageView
                                                                 Width:200
                                                                Height:40
                                                             Direction:CJNoticeDirectionUp3];
    
    UILabel *labelImageView = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 180, 30)];
    labelImageView.text = @"ImageView测试";
    labelImageView.textColor = [UIColor whiteColor];
    [viewImageView.backView addSubview:labelImageView];
    [viewImageView popView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
