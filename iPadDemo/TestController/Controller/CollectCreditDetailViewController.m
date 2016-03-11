//
//  CollectCreditDetailViewController.m
//  WecashHD
//
//  Created by 张庆杰 on 16/3/10.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

#import "CollectCreditDetailViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "MainViewController.h"

#define gRandomColor [UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0 blue:arc4random() % 256 / 256.0 alpha:1.0]

@interface CollectCreditDetailViewController ()

@property (nonatomic, strong) UIView *contentView;

@end

@implementation CollectCreditDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"CollectCreditDetail";
    
    [self setupControllers];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self setupContentView];
}

- (void)setupControllers {
    OneViewController *oneVc = [[OneViewController alloc] init];
    oneVc.view.backgroundColor = gRandomColor;
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:oneVc]];
    [oneVc.view removeFromSuperview];
    
    TwoViewController *twoVc = [[TwoViewController alloc] init];
    twoVc.view.backgroundColor = gRandomColor;
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:twoVc]];
    [twoVc.view removeFromSuperview];
}

- (void)setupContentView {
    UIView *contentView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:contentView];
    self.contentView = contentView;
}

#pragma mark - CollectCreditViewControllerDelegate

- (void)collectCreditViewController:(CollectCreditViewController *)ccVc didSelectedFromIndex:(NSInteger)from toIndex:(NSInteger)to {
    // OldViewController
    UIViewController *oldVc = self.childViewControllers[from];
    [oldVc.view removeFromSuperview];
    
    // NewViewController
    UIViewController *newVc = self.childViewControllers[to];
    newVc.view.frame = self.contentView.bounds;
    [self.contentView addSubview:newVc.view];
}

@end
