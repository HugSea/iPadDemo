//
//  Dock.h
//  WecashHD
//
//  Created by 张庆杰 on 16/3/10.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBar;

@interface Dock : UIView

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) TabBar *tabBar;

@end
