#import "FlutterBootPlugin.h"
#if __has_include(<flutter_boot/flutter_boot-Swift.h>)
#import <flutter_boot/flutter_boot-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_boot-Swift.h"
#endif

@implementation FlutterBootPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterBootPlugin registerWithRegistrar:registrar];
}
@end
