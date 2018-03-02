//
//  ViewController.m
//  practice
//
//  Created by wenhua on 2017/12/22.
//  Copyright © 2017年 wenhua. All rights reserved.
//

#import "ViewController.h"
#import "DCViewController.h"
#import "YLDoubleViewController.h"
#import "DCFirstViewController.h"
#import "DCSecondViewController.h"
@interface ViewController ()
{
    UIView *btnView;
    UIButton *btn1;
    UIButton *btn2;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}
-(void)btnDidClick
{
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.baidu.com"]];
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.baidu.com"] options:nil completionHandler:^(BOOL success) {
//        NSLog(@"success");
//    }];
    DCViewController *vc = [[DCViewController alloc]init];
    [self presentViewController:vc animated:NO completion:nil];
 
//    YLDoubleViewController *VC = [[YLDoubleViewController alloc]initWithRightVC:[[DCSecondViewController alloc]init] andLeftVC:[[DCFirstViewController alloc]init]];
//    VC.leftTitle = @"left";
//    VC.rightTitle = @"right";
//    [self presentViewController:VC animated:NO completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
