//
//  DCChooseViewController.h
//  practice
//
//  Created by wenhua on 2017/12/25.
//  Copyright © 2017年 wenhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCChooseViewController : UIViewController

//控制器名
@property (nonatomic, strong) NSArray *VcNames;
//选择栏
@property(nonatomic, strong) UIView *clickBarView;

@property(nonatomic,strong)UIView * backBtnView;
//底部容器scrollView
@property (strong, nonatomic) UIScrollView *containerScrollerView;

-(void)addChildControllersWithFirstVC:(UIViewController *)firstVC secondVC:(UIViewController *)secondVC;

@end
