//
//  ViewController.m
//  NSProxyDemo
//
//  Created by Zhuge_Magic on 2017/9/6.
//  Copyright © 2017年 magic. All rights reserved.
//

#import "ViewController.h"
#import "ZGProxyManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 模拟多继承
    ZGProxyManager * manager =[ZGProxyManager sharedProxyManager];
    [manager bookTraderTest];
    [manager fruitTraderTest];
}

@end
