//
//  DCChooseViewController.m
//  practice
//
//  Created by wenhua on 2017/12/25.
//  Copyright © 2017年 wenhua. All rights reserved.
//

#import "DCChooseViewController.h"
//宏
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height

@interface DCChooseViewController ()<UIScrollViewDelegate>

@end

@implementation DCChooseViewController

- (UIScrollView *)containerScrollerView
{
    if (!_containerScrollerView) {
        _containerScrollerView = [[UIScrollView alloc]init];
        _containerScrollerView.pagingEnabled = YES;
        _containerScrollerView.showsVerticalScrollIndicator = NO;
        _containerScrollerView.showsHorizontalScrollIndicator = NO;
        _containerScrollerView.contentSize = CGSizeMake(kScreenWidth *self.VcNames.count,kScreenHeight);
        _containerScrollerView.backgroundColor = [UIColor whiteColor];
        _containerScrollerView.delegate = self;
    }
    return _containerScrollerView;
}

//点击选择栏
- (UIView *)clickBarView
{
    if (!_clickBarView) {
        _clickBarView = [[UIView alloc]init];
        _clickBarView.backgroundColor = [UIColor lightGrayColor];
        
        CGFloat width = kScreenWidth / 2;
        CGFloat height = 44;
        
        _backBtnView = [[UIView alloc]init];
        _backBtnView.backgroundColor = [UIColor whiteColor];
        _backBtnView.frame = CGRectMake(0, 0, width, 44);
        [_clickBarView addSubview:_backBtnView];
        //初始化按钮
        for (NSInteger i = 0; i < 2; i++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:self.VcNames[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            button.frame = CGRectMake(width * i, 0, width, height);
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            //绑定tag值
            button.tag = i;
            [_clickBarView addSubview:button];
        }
        
    }
    return _clickBarView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpScrollView];
}
-(void)setUpScrollView{
    self.edgesForExtendedLayout = 0;
    //初始化选择栏
    [self initClickBar];
    
    //初始化底部scrollView容器
    [self initScrollViewContainer];
    
    //初始化子控制器
//    [self addChildControllersWithFirstVC:<#(UIViewController *)#> secondVC:<#(UIViewController *)#>];
}
//按钮选择栏
- (void)initClickBar
{
    [self.view addSubview:self.clickBarView];
    
    self.clickBarView.frame = CGRectMake(0, 20,kScreenWidth,44);
}

//初始化滑动容器
- (void)initScrollViewContainer
{
    [self.view addSubview:self.containerScrollerView];
    self.containerScrollerView.frame = CGRectMake(0,CGRectGetMaxY(self.clickBarView.frame),kScreenWidth, kScreenHeight );
}
//添加子控制器
- (void)addChildControllersWithFirstVC:(UIViewController *)firstVC secondVC:(UIViewController *)secondVC
{
//    DCFirstViewController *firstVc = [[DCFirstViewController alloc]init];
//    firstVc.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:firstVC];
    
//    DCSecondViewController *secondVc = [[DCSecondViewController alloc]init];
//    secondVc.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:secondVC];
    
    //默认展示第一个子控制器
    [self scrollViewDidEndDecelerating:self.containerScrollerView];
}
//选择栏按钮点击事件
- (void)buttonClick:(UIButton *)button
{
    [self.containerScrollerView setContentOffset:CGPointMake(button.tag *kScreenWidth, 0) animated:YES];
    
    if (button.tag == 0) {
        
        [UIView animateWithDuration:0.5 animations:^{
            _backBtnView.frame = CGRectMake(0, 0, kScreenWidth / 2, 44);
        }];
    }
    if (button.tag == 1) {
        
        [UIView animateWithDuration:0.5 animations:^{
            _backBtnView.frame = CGRectMake(kScreenWidth / 2, 0, kScreenWidth / 2, 44);
        }];
    }
}

//滑动减速时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //获取contentOffset
    CGPoint currentOffset = scrollView.contentOffset;
    
    NSInteger page = currentOffset.x / kScreenWidth;
    
    //取出对应控制器
    UIViewController *viewController = self.childViewControllers[page];
    
    //添加到scrollView容器
    
    [self.containerScrollerView addSubview:viewController.view];
    viewController.view.frame = CGRectMake(page *kScreenWidth, 0,kScreenWidth, kScreenHeight);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
