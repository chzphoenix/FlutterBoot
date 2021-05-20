//
//  FlutterBootEngine.h
//
//  Created by bennu on 2021/5/19.
//

#ifndef FlutterBootEngine_h
#define FlutterBootEngine_h

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

@interface FlutterBootEngine : NSObject

+ (nonnull instancetype)sharedInstance;

- (FlutterBasicMessageChannel *)channel;
- (FlutterEngine *)engine;
- (void)initEngine;
@end

#endif /* FlutterBootEngine_h */
