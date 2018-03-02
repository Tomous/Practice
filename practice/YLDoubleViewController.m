//
//  YLDoubleViewController.m
//  textRoaidButton
//
//  Created by shuogao on 16/8/25.
//  Copyright © 2016年 Yulu Zhang. All rights reserved.
//

#import "YLDoubleViewController.h"
@interface YLDoubleViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;//滚动视图
@property (nonatomic,strong) UIView *line;
@property (nonatomic,strong) UIButton *rightButton;
@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UIColor *highlightColor;
@end

@implementation YLDoubleViewController
#define BUTTONHIGHT  40//顶部按钮高度
#define SCREENRECT   [UIScreen mainScreen].bounds//屏幕尺寸
- (UIButton *)rightButton {

    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _rightButton.frame = CGRectMake(0, 0, CGRectGetMaxX(SCREENRECT) / 2 - 2, BUTTONHIGHT);
        [_rightButton setBackgroundColor:[UIColor whiteColor]];
        [_rightButton setTitle:@"第一" forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(changeVC:) forControlEvents:UIControlEventTouchUpInside];
        _rightButton.tag = 111;
    }
    return _rightButton;

}
- (UIButton *)leftButton {

    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _leftButton.frame = CGRectMake(CGRectGetWidth(self.rightButton.frame) + 2, 0, CGRectGetMaxX(SCREENRECT) / 2 - 2, BUTTONHIGHT);
        [_leftButton setBackgroundColor:[UIColor whiteColor]];
        [_leftButton setTitle:@"第二" forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(changeVC:) forControlEvents:UIControlEventTouchUpInside];
        _leftButton.tag = 222;
        [_leftButton setTintColor:[UIColor blackColor]];
    }
    return _leftButton;
    
}

- (UIView *)line {

    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, BUTTONHIGHT, CGRectGetWidth(SCREENRECT) / 2 - 2, 2)];
        _line.backgroundColor = self.lineColor?self.lineColor:[UIColor redColor];
    }
    return _line;

}
- (UIScrollView *)scrollView {

    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, BUTTONHIGHT + 2, CGRectGetWidth(SCREENRECT), CGRectGetHeight(SCREENRECT) - BUTTONHIGHT - 2)];
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(SCREENRECT) * 2, CGRectGetHeight(SCREENRECT) - BUTTONHIGHT - 2);
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

- (instancetype)initWithRightVC:(UIViewController *)rVc andLeftVC:(UIViewController *)lVc {


    rVc.view.frame = CGRectMake(0, 0, CGRectGetWidth(SCREENRECT), CGRectGetHeight(self.scrollView.frame));
    lVc.view.frame = CGRectMake(CGRectGetWidth(SCREENRECT), 0, CGRectGetWidth(SCREENRECT), CGRectGetHeight(self.scrollView.frame));
    [self.scrollView addSubview:rVc.view];
    [self.scrollView addSubview:lVc.view];
    //设为子控制器。方便子控制器的事件、界面跳转
    [self addChildViewController:rVc];
    [self addChildViewController:lVc];

    return self;

}

#pragma mark -- 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:222/255. green:222/255. blue:222/255. alpha:1.];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.rightButton];
    [self.view addSubview:self.leftButton];
    [self.view addSubview:self.line];
    [self.rightButton setTintColor:self.highlightColor ? self.highlightColor : [UIColor redColor]];

}

#pragma mark -- set/get...

- (void)setLineColor:(UIColor *)lineColor {

    self.line.backgroundColor = lineColor;

}

- (void)setButtonHighlightColor:(UIColor *)buttonHighlightColor {

    self.highlightColor = buttonHighlightColor;

}

- (void)setButtonFont:(UIFont *)buttonFont {

    self.leftButton.titleLabel.font = buttonFont;
    self.rightButton.titleLabel.font = buttonFont;
}

- (void)setLeftButtonColor:(UIColor *)leftButtonColor {

    [self.leftButton setBackgroundColor:leftButtonColor];
}

- (void)setRightButtonColor:(UIColor *)rightButtonColor {

    [self.rightButton setBackgroundColor:rightButtonColor];
}
- (void)setRightTitle:(NSString *)rightTitle {

    [self.rightButton setTitle:rightTitle forState:UIControlStateNormal];


}
- (void)setLeftTitle:(NSString *)leftTitle {

    [self.leftButton setTitle:leftTitle forState:UIControlStateNormal];

}
#pragma mark -- sender

- (void)changeVC:(UIButton *)button {

    if (button.tag == 111) {

        [UIView animateWithDuration:0.3f animations:^{

            self.line.center = CGPointMake(CGRectGetWidth(SCREENRECT) / 4 - 2, self.line.center.y);
            self.scrollView.contentOffset = CGPointMake(0, 0);
        }];

    }else {

        [UIView animateWithDuration:0.3f animations:^{

            self.line.center = CGPointMake(CGRectGetWidth(SCREENRECT) * 3 / 4 + 2, self.line.center.y);

            self.scrollView.contentOffset = CGPointMake(self.view.bounds.size.width, 0);
            
        }];

    }


}

#pragma mark -- UIScrollerViewDelegate

- (void)scrollViewDidScroll:(UIScrollView*)scrollView {

    self.line.center = CGPointMake(scrollView.contentOffset.x / 2 - 2 + self.view.bounds.size.width / 4 + 2, self.line.center.y);
    if (scrollView.contentOffset.x < CGRectGetWidth(SCREENRECT) / 2 - 2) {
        [self.rightButton setTintColor:self.highlightColor ? self.highlightColor : [UIColor redColor]];
        [self.leftButton setTintColor:[UIColor blackColor]];
    }else {
        [self.leftButton setTintColor:self.highlightColor ? self.highlightColor : [UIColor redColor]];
        [self.rightButton setTintColor:[UIColor blackColor]];

    }

}



@end
