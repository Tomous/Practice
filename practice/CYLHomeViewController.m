//
//  CYLHomeViewController.m
//  金恒信息科技有限公司
//
//  Created by 1 on 2017/12/20.
//
//

#import "CYLHomeViewController.h"
//#import "HomePageCollectionController.h"
//#import <CYLTabBarController.h>
//#import "IntelligentViewController.h"
//#import <MJCSegmentInterface.h>
//#import "WZSwitch.h"
//#import "HomeDataTableViewCell.h"
//#import "CYLHomeRankingView.h"
//#import "StudyViewController.h"
#import "DCFirstViewController.h"
#import "DCSecondViewController.h"
//宏
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface CYLHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>


//@property(nonatomic,strong)WZSwitch     *mySwitch;

@property (nonatomic, strong) UITableView *tableview;

@property (strong, nonatomic) UIView *Topview;

//@property (strong, nonatomic) CYLHomeRankingView   *kingView;

//@property (nonatomic, strong) WMPageController *pageController;

@property(nonatomic,strong)UIView *btnView;

//底部容器scrollView
@property (strong, nonatomic) UIScrollView *containerScrollerView;

@end

@implementation CYLHomeViewController

- (UIScrollView *)containerScrollerView
{
    if (!_containerScrollerView) {
        _containerScrollerView = [[UIScrollView alloc]init];
        _containerScrollerView.pagingEnabled = YES;
        _containerScrollerView.showsVerticalScrollIndicator = NO;
        _containerScrollerView.showsHorizontalScrollIndicator = NO;
        _containerScrollerView.contentSize = CGSizeMake(kScreenWidth *2,kScreenHeight);
        _containerScrollerView.backgroundColor = [UIColor whiteColor];
        _containerScrollerView.delegate = self;
    }
    return _containerScrollerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
 
    [self.navigationController.navigationBar setBackgroundImage: [UIImage imageNamed:@"lanlanqq"] forBarMetrics:UIBarMetricsDefault];

    //导航栏
    [self CYLHometionIte];
    
    
//    WMMenuViewStyle style = [@(WMMenuViewStyleFlood) integerValue];
//    self.title = @"WMMenuViewStyleFlood";
//    self.menuViewStyle = style;
//    self.automaticallyCalculatesItemWidths = YES;
//    
//    self.titleColorSelected = [UIColor colorWithHexString:@"#22aaff"];
//    self.titleColorNormal = [UIColor whiteColor];
//    self.progressColor = [UIColor whiteColor];
//    self.showOnNavigationBar = NO;
//    self.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
//    self.titleSizeSelected = 15;


    
    
    //头部view
    [self TopbottomView];
    
    //初始化底部scrollView容器
    [self initScrollViewContainer];
    
    //初始化子控制器
    [self addChildControllers];
    
//    if (self.menuViewStyle == WMMenuViewStyleFlood) {
//        [self.view addSubview:self.Topview];
//    }

    
    
    //UI界面
//    [self CYLHomeUI];

    
    
    
    
 }
//初始化滑动容器
- (void)initScrollViewContainer
{
    [self.view addSubview:self.containerScrollerView];
    self.containerScrollerView.frame = CGRectMake(0,CGRectGetMaxY(self.Topview.frame),kScreenWidth, kScreenHeight );
}

//添加子控制器
- (void)addChildControllers
{
    DCFirstViewController *firstVc = [[DCFirstViewController alloc]init];
    firstVc.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:firstVc];
    
    DCSecondViewController *secondVc = [[DCSecondViewController alloc]init];
    secondVc.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:secondVc];
    
    //默认展示第一个子控制器
    [self scrollViewDidEndDecelerating:self.containerScrollerView];
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
#pragma mark -导航栏
- (void)CYLHometionIte{
    

//    [self.navigationController.navigationBar setTitleTextAttributes:
//
//
//     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
//
//
//       NSForegroundColorAttributeName:[UIColor whiteColor]}];
//
//
//    //去掉透明后导航栏下边的黑边
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
//
//    //左边按钮
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ffhuhu"] style:(UIBarButtonItemStylePlain) target:self action:@selector(CYLHomeestorClick)];
//    //右边按钮
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"gengdd"] style:(UIBarButtonItemStylePlain) target:self action:@selector(CYLHomeClick)];
//
//
//    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 35)];
//    [self.navigationItem.titleView sizeToFit];
//    self.navigationItem.titleView = titleView;
//
//    UILabel *titlebel = [[UILabel alloc] init];
//    titlebel.text = @"共享图书";
//    titlebel.textAlignment = NSTextAlignmentRight;
//    titlebel.textColor = [UIColor whiteColor];
//    [titleView addSubview:titlebel];
    
//    titlebel.sd_layout
//    .centerXEqualToView(titleView)
//    .leftSpaceToView(titleView,50)
//    .centerYEqualToView(titleView)
//    .widthIs(100)
//    .heightIs(21);

    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.backgroundColor = [UIColor redColor];
//    [btn setTitle:@"徐州市" forState:UIControlStateNormal];
//    btn.titleLabel.font = [UIFont systemFontOfSize:10];
//    UIImage *image = [UIImage imageNamed:@"xiaodaojiao"];
//    [btn setImage:image forState:UIControlStateNormal];
//    CGFloat labelWidth = [btn.titleLabel.text sizeWithFont:btn.titleLabel.font].width;
//    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -image.size.width, 0, image.size.width)];
//    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, labelWidth, 0, -labelWidth)];
//    btn.layer.cornerRadius = 8;
//    [titleView addSubview:btn];
    
//    btn.sd_layout
//    .rightSpaceToView(titleView,70)
//    .topSpaceToView(titleView,5)
//    .widthIs(53)
//    .heightIs(22);
    
}

#pragma 头部的View
- (void)TopbottomView
{
    
    self.Topview = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 70)];
     self.Topview.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview: self.Topview];
    
//     self.Topview.sd_layout
//    .topSpaceToView(self.view,0)
//    .leftSpaceToView(self.view,0)
//    .rightSpaceToView(self.view,0)
//    .heightIs(50);
    
  
    self.btnView =[[UIView alloc]init];
    self.btnView.layer.masksToBounds = YES;
    self.btnView.layer.cornerRadius = 20;
    self.btnView.frame = CGRectMake(10, 10, 100, 40);
    self.btnView.backgroundColor =[UIColor whiteColor];
    [self.Topview addSubview:self.btnView];
    
    
    UIButton *shareBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame =CGRectMake(10, 10, 100, 40);
    
    shareBtn.tag = 1;
    [shareBtn setTitle:@"共享书屋" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
    [shareBtn addTarget:self action:@selector(onSharebtn:) forControlEvents:UIControlEventTouchUpInside];
    //    self.view.backgroundColor =[UIColor blueColor];
    shareBtn.selected =YES;
    [self.Topview addSubview:shareBtn];
    
    
    
    UIButton *readBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    readBtn.frame =CGRectMake(130, 10, 100, 40);
    
    readBtn.tag = 2;
    [readBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [readBtn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
    [readBtn setTitle:@"读书达人" forState:UIControlStateNormal];
    [readBtn addTarget:self action:@selector(onSharebtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.Topview addSubview:readBtn];
    
    
   

    
}

#pragma mark -返回
- (void)CYLHomeestorClick{
    
    
    
//    CYLTabBarController *tab = (CYLTabBarController *)self.tabBarController;
//    [tab.originalNavController popViewControllerAnimated:YES];

  
    
    
}
#pragma mark - 更多 
//- (void)CYLHomeClick{
//
//    NSLog(@"sdsds");
//
//}

#pragma maek -  UI
- (void)CYLHomeUI{

    
//    self.tableview =[[UITableView alloc] initWithFrame:CGRectMake(0, 50, k_screenWidth, k_screenHeight - 64-49) style:UITableViewStyleGrouped];
//    // 代理人
//    self.tableview.dataSource = self;
//
//    self.tableview.delegate = self;
//
//
//    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
//
//    self.tableview.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
//
//    [self.view addSubview:self.tableview];
    
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//
//    return 10;
//
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{

//    HomeDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeDataTableViewCell"];
//    if (cell == nil) {
//
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeDataTableViewCell" owner:self options:nil]lastObject];
//
//    }
    
//    return cell;
//
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{

//    if (section == 0) {
//        self.kingView = [[[NSBundle mainBundle]loadNibNamed:@"CYLHomeRankingView" owner:self options:nil]lastObject];
//
//            self.kingView.bjView.layer.cornerRadius = 20;
//            self.kingView.bjView.layer.masksToBounds = YES;
//
//
//            self.kingView.image1.layer.cornerRadius = 10;
//            self.kingView.image1.layer.masksToBounds = YES;
//
//            self.kingView.image2.layer.cornerRadius = 10;
//            self.kingView.image2.layer.masksToBounds = YES;
//
//           self.kingView.image3.layer.cornerRadius = 10;
//            self.kingView.image3.layer.masksToBounds = YES;
//
//
//
//        return self.kingView;
//
//    }else{
//
//        return nil;
//
//    }

//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//
//    return 210;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    return 180;
//
//}


//- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
//    switch (self.menuViewStyle) {
//            
//        case WMMenuViewStyleFlood: return 2;
//        default: return 2;
//    }
//}
//
//- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
//    switch (index % 2) {
//        case 0: return @"共享书屋";
//        case 1: return @"读书达人";
//    }
//    return @"NONE";
//}
//
//- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
//    switch (index % 2) {
//        case 0: return [[StudyViewController alloc] init];
//        case 1: return [[IntelligentViewController alloc] init];
//    }
//    return [[UIViewController alloc] init];
//}
//

-(void)onSharebtn:(UIButton *)btn{
    
    if (btn.tag ==1) {
        
        if (btn.selected ==YES) {
            
            
            return;
            
        }
        else {
            UIButton *shareBtn = [self.view viewWithTag:2];
            shareBtn.selected =NO;
            
            [UIView animateWithDuration:0.5 animations:^{
                
                self.btnView.frame = btn.frame;
                
            }];
            self.containerScrollerView.contentOffset = CGPointMake(0, 0);
 
            btn.selected = YES;
            
        }
        
    }
    
    if (btn.tag ==2) {
        
        if (btn.selected ==YES) {
            
            
            
            return;
            
        }
        else {
            UIButton *shareBtn = [self.view viewWithTag:1];
            shareBtn.selected =NO;
            
            [UIView animateWithDuration:0.5 animations:^{
                
                self.btnView.frame = btn.frame;
                
            }];
            self.containerScrollerView.contentOffset = CGPointMake(kScreenWidth, 0);
            btn.selected = YES;
            
        }
        
    }
    
    
    
}
@end
