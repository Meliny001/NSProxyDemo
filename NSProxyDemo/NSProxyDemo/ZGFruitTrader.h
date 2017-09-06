//
//  ZGFruitTrader.h
//  NSProxyDemo
//
//  Created by Zhuge_Magic on 2017/9/6.
//  Copyright © 2017年 magic. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZGFruitTraderDelegate <NSObject>

- (void)fruitTraderTest;

@end

@interface ZGFruitTrader : NSObject

@end
