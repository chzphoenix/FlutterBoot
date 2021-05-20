//
//  FlutterBootEngine.m
//
//  Created by bennu on 2021/5/19.
//

#import "FlutterBootEngine.h"
#import <Flutter/Flutter.h>

@implementation FlutterBootEngine

static FlutterBootEngine * instance = nil;

FlutterEngine * engine = nil;
FlutterBasicMessageChannel * channel = nil;

+(nonnull FlutterBootEngine *)sharedInstance{
    if(instance == nil){
        instance = [self.class new];
    }
    return instance;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    if(instance == nil){
        instance = [[super allocWithZone:zone]init];
    }
    return instance;
}

- (id)copyWithZone:(NSZone *)zone{
    return instance;
}

- (FlutterEngine *)engine{
    return engine;
}

- (FlutterBasicMessageChannel *)channel{
    return channel;
}

- (void)initEngine{
    engine = [[FlutterEngine alloc]initWithName:@"flutter engine"];
    channel = [FlutterBasicMessageChannel messageChannelWithName:@"startPage" binaryMessenger:engine.binaryMessenger codec:[FlutterStringCodec sharedInstance]];
    [engine run];
}

@end
