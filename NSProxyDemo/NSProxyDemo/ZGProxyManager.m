//
//  ZGProxyManager.m
//  NSProxyDemo
//
//  Created by Zhuge_Magic on 2017/9/6.
//  Copyright © 2017年 magic. All rights reserved.
//

#import "ZGProxyManager.h"
#import <objc/runtime.h>


@implementation ZGProxyManager
{
    ZGBookTrader * _bookTrader;
    ZGFruitTrader * _fruitTrader;
    NSMutableDictionary * _proxyDict;
}
+ (__kindof ZGProxyManager *)sharedProxyManager
{
    return [[ZGProxyManager alloc]init];
}
- (instancetype)init
{
    _bookTrader = [[ZGBookTrader alloc]init];
    _fruitTrader = [[ZGFruitTrader alloc]init];
    _proxyDict = [NSMutableDictionary dictionary];
    
    // Map method
    [self registerMethodsWithTarget:_bookTrader];
    [self registerMethodsWithTarget:_fruitTrader];
    
    return self;
}

- (void)registerMethodsWithTarget:(id)target
{
    unsigned int count;
    Method * methodlist = class_copyMethodList([target class], &count);
    for (int i =0; i <count; i ++) {
        SEL sel = method_getName(methodlist[i]);
        NSString * name = [NSString stringWithUTF8String:sel_getName(sel)];
        [_proxyDict setObject:target forKey:name];
    }
    free(methodlist);
}
- (void)forwardInvocation:(NSInvocation *)invocation
{
    SEL sel = invocation.selector;
    NSString * name = [NSString stringWithUTF8String:sel_getName(sel)];
    id target = _proxyDict[name];
    if ([target respondsToSelector:sel]) {
        [invocation invokeWithTarget:target];
    }else
    {
        [super forwardInvocation:invocation];
    }
}
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSString * name = [NSString stringWithUTF8String:sel_getName(sel)];
    id target = _proxyDict[name];
    if ([target respondsToSelector:sel]) {
        return [target methodSignatureForSelector:sel];
    }else
    {
        return [super methodSignatureForSelector:sel];
    }
}
@end
