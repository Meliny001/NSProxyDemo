//
//  SecondViewController.m
//  NSProxyDemo
//
//  Created by Zhuge_Magic on 2017/9/6.
//  Copyright © 2017年 magic. All rights reserved.
//

#import "SecondViewController.h"
#import "ZGWeakProxy.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
{
    NSTimer * _timer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 解决NSTimer循环引用
    self.view.backgroundColor = [UIColor greenColor];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:[ZGWeakProxy proxyWithTarget:self] selector:@selector(show) userInfo:nil repeats:YES];
}

- (void)show
{
    NSLog(@"1");
}

- (void)dealloc
{
    [_timer invalidate];
    _timer = nil;
    NSLog(@"dealloc");
}
@end
