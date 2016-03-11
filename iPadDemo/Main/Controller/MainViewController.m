//
//  MainViewController.m
//  WecashHD
//
//  Created by 张庆杰 on 16/3/10.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

#import "MainViewController.h"
#import "Dock.h"
#import "TabBar.h"
#import "UIView+Positioning.h"
#import "CollectCreditViewController.h"
#import "CollectCreditDetailViewController.h"

#define gRandomColor [UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0 blue:arc4random() % 256 / 256.0 alpha:1.0]

@interface MainViewController () <TabBarDelegate>

// Dock
@property (nonatomic, strong) UIView *dock;

@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation MainViewController

static id _instance = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 创建Dock
    [self setupDock];
    
    // 创建控制器
    [self setupControllers];
    
    // 创建子视图
    [self setupMasterAndDetailView];
}

+ (instancetype)sharedMainViewController {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (void)setupDock {
    Dock *dock = [[Dock alloc] init];
    [self.view addSubview:dock];
    dock.tabBar.delegate = self;
    self.dock = dock;
}

- (void)setupControllers {
    // 我要借钱
    UIViewController *vc11 = [[UIViewController alloc] init];
    vc11.view.backgroundColor = gRandomColor;
    [self packNv:vc11];
    UIViewController *vc12 = [[UIViewController alloc] init];
    vc12.view.backgroundColor = gRandomColor;
    [self packNv:vc12];
    // 我要分期
    UIViewController *vc21 = [[UIViewController alloc] init];
    vc21.view.backgroundColor = gRandomColor;
    [self packNv:vc21];
    UIViewController *vc22 = [[UIViewController alloc] init];
    vc22.view.backgroundColor = gRandomColor;
    [self packNv:vc22];
    // 攒信用
    CollectCreditViewController *ccVc = [[CollectCreditViewController alloc] init];
    ccVc.view.backgroundColor = gRandomColor;
    [self packNv:ccVc];
    CollectCreditDetailViewController *ccdVc = [[CollectCreditDetailViewController alloc] init];
    ccdVc.view.backgroundColor = gRandomColor;
    ccVc.delegate = ccdVc;
    [self addChildViewController:ccdVc];
    // 信用档案
    UIViewController *vc41 = [[UIViewController alloc] init];
    vc41.view.backgroundColor = gRandomColor;
    [self packNv:vc41];
    UIViewController *vc42 = [[UIViewController alloc] init];
    vc42.view.backgroundColor = gRandomColor;
    [self packNv:vc42];
    // 个人中心
    UIViewController *vc51 = [[UIViewController alloc] init];
    vc51.view.backgroundColor = gRandomColor;
    [self packNv:vc51];
    UIViewController *vc52 = [[UIViewController alloc] init];
    vc52.view.backgroundColor = gRandomColor;
    [self packNv:vc52];
}

- (void)packNv:(UIViewController *)vc {
    UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nv];
}

- (void)setupMasterAndDetailView {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    UIView *masterView = [[UIView alloc] initWithFrame:CGRectMake(self.dock.width, 20, screenWidth * 0.45, screenHeight - 20)];
    [self.view addSubview:masterView];
    self.masterView = masterView;
    
    UIView *detailView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(masterView.frame), 20, screenWidth * 0.45, screenHeight - 20)];
    [self.view addSubview:detailView];
    self.detailView = detailView;
}

#pragma mark - TabBarDelegate

- (void)tabBar:(TabBar *)tabBar didSelectedFromIndex:(NSInteger)from toIndex:(NSInteger)to {
    // From
    UIViewController *oldMasterVc = self.childViewControllers[from];
    [oldMasterVc.view removeFromSuperview];
    UIViewController *oldDetailVc = self.childViewControllers[from + 1];
    [oldDetailVc.view removeFromSuperview];
    // To
    UIViewController *newMasterVc = self.childViewControllers[to];
    newMasterVc.view.frame = self.masterView.bounds;
    [self.masterView addSubview:newMasterVc.view];
    UIViewController *newDetailVc = self.childViewControllers[to + 1];
    newDetailVc.view.frame = self.detailView.bounds;
    [self.detailView addSubview:newDetailVc.view];
    self.currentIndex = to;
}

@end
