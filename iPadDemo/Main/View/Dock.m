//
//  Dock.m
//  WecashHD
//
//  Created by 张庆杰 on 16/3/10.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

#import "Dock.h"
#import "TabBar.h"
#import "UIView+Positioning.h"

#define gScreenWidth [UIScreen mainScreen].bounds.size.width
#define gScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation Dock

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
        // 顶部
        _topView = [[UIView alloc] init];
        _topView.backgroundColor = [UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:1.000];
        [self addSubview:_topView];
        
        // tabBar
        _tabBar = [[TabBar alloc] init];
        [self addSubview:_tabBar];
    }
    return self;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    self.width = gScreenWidth * 0.1;
    self.height = gScreenHeight;
    self.x = 0;
    self.y = 20.0;
    
    // 顶部视图
    _topView.frame = CGRectMake(0, 0, self.width, 200);
    
    // TabBar
    [self.tabBar setupFrameWithY:_topView.height];
}

@end
