//
//  CollectCreditViewController.m
//  WecashHD
//
//  Created by 张庆杰 on 16/3/10.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

#import "CollectCreditViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "MainViewController.h"

#define gRandomColor [UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0 blue:arc4random() % 256 / 256.0 alpha:1.0]

@interface CollectCreditViewController ()

@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation CollectCreditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"CollectCredit";
    
    UIButton *btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btnOne];
    btnOne.backgroundColor = [UIColor blueColor];
    btnOne.tag = 0;
    btnOne.frame = CGRectMake(100, 100, 100, 100);
    [btnOne addTarget:self action:@selector(btnOneClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btnTwo];
    btnTwo.backgroundColor = [UIColor blueColor];
    btnTwo.tag = 1;
    btnTwo.frame = CGRectMake(100, 300, 100, 100);
    [btnTwo addTarget:self action:@selector(btnTwoClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnOneClick {
    if (self.delegate && [self.delegate respondsToSelector:@selector(collectCreditViewController:didSelectedFromIndex:toIndex:)]) {
        [self.delegate collectCreditViewController:self didSelectedFromIndex:self.currentIndex toIndex:0];
        self.currentIndex = 0;
    }
}

- (void)btnTwoClick {
    if (self.delegate && [self.delegate respondsToSelector:@selector(collectCreditViewController:didSelectedFromIndex:toIndex:)]) {
        [self.delegate collectCreditViewController:self didSelectedFromIndex:self.currentIndex toIndex:1];
        self.currentIndex = 1;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = gRandomColor;
    [self.navigationController pushViewController:vc animated:YES];
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
