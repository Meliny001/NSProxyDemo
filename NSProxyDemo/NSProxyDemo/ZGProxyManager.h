//
//  ZGProxyManager.h
//  NSProxyDemo
//
//  Created by Zhuge_Magic on 2017/9/6.
//  Copyright © 2017年 magic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGBookTrader.h"
#import "ZGFruitTrader.h"

@interface ZGProxyManager : NSProxy<ZGBookTraderDelegate,ZGFruitTraderDelegate>
+ (__kindof ZGProxyManager *)sharedProxyManager;
@end
