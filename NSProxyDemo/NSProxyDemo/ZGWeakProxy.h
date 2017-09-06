//
//  ZGWeakProxy.h
//  NSProxyDemo
//
//  Created by Zhuge_Magic on 2017/9/6.
//  Copyright © 2017年 magic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGWeakProxy : NSProxy
@property (nonatomic, weak, readonly) id target;
- (instancetype)initWithTarget:(id)target;
+ (instancetype)proxyWithTarget:(id)target;
@end
