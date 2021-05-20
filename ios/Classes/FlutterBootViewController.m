//
//  BootViewController.m
//
//  Created by bennu on 2021/5/18.
//

#import "FlutterBootViewController.h"
#import "FlutterBootEngine.h"

@implementation FlutterBootViewController

NSString * mRoute = nil;
NSDictionary * mParams = nil;

- (nonnull instancetype)initWithRoute:(nonnull NSString *)route params:(nullable NSDictionary *)params{
    self = [super initWithEngine:FlutterBootEngine.sharedInstance.engine nibName:nil bundle:nil];
    mRoute = route;
    mParams = params;
    return self;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if(mParams == nil){
        mParams = [[NSDictionary alloc]init];
    }
    NSDictionary * dict = @{@"route" : mRoute, @"params" : mParams};
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
    [FlutterBootEngine.sharedInstance.channel sendMessage:[[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding]];
}

@end
