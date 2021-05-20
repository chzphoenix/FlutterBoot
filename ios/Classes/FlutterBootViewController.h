//
//  BootViewController.h
//
//  Created by bennu on 2021/5/18.
//

#ifndef FlutterBootViewController_h
#define FlutterBootViewController_h

#import <Flutter/FlutterViewController.h>

@interface FlutterBootViewController : FlutterViewController

- (nonnull instancetype)initWithRoute:(nonnull NSString*)route
                       params:(nullable NSDictionary*)params;

@end

#endif /* FlutterBootViewController_h */
