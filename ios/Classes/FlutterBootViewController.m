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

//viewDidAppear时机有点晚，会先显示一下上一个页面才更新到新页面，所以换成viewWillAppear
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(mParams == nil){
        mParams = [[NSDictionary alloc]init];
    }
    NSDictionary * dict = @{@"route" : mRoute, @"params" : mParams};
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
    NSString * str = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", str);
    [FlutterBootEngine.sharedInstance.channel sendMessage:str];
}

@end
