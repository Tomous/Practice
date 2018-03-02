//
//  YLDoubleViewController.h
//  textRoaidButton
//
//  Created by shuogao on 16/8/25.
//  Copyright © 2016年 Yulu Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLDoubleViewController : UIViewController

/**
 *  公开属性
 */
@property (nonatomic,strong) UIColor *buttonHighlightColor;//按钮高亮字体颜色
@property (nonatomic,strong) UIColor *lineColor;//滑动线条的背景色
@property (nonatomic,strong) UIColor *leftButtonColor;//左侧按钮背景色
@property (nonatomic,strong) UIColor *rightButtonColor;//右侧按钮背景色
@property (nonatomic,strong) UIFont *buttonFont;//按钮字体
@property (nonatomic,strong) NSString *rightTitle;//左按钮标题
@property (nonatomic,strong) NSString *leftTitle;//右按钮标题
/**
 *  初始化方法
 *  传进来左右两个控制器
 */

- (instancetype)initWithRightVC:(UIViewController *)rVc andLeftVC:(UIViewController *)lVc;

@end
