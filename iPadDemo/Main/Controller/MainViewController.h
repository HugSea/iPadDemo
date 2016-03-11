//
//  MainViewController.h
//  WecashHD
//
//  Created by 张庆杰 on 16/3/10.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

// 左侧View
@property (nonatomic, strong) UIView *masterView;
// 右侧View
@property (nonatomic, strong) UIView *detailView;

+ (instancetype)sharedMainViewController;

@end
