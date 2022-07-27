#import "GestureDetectorToNativePlugin.h"
#if __has_include(<gesture_detector_to_native/gesture_detector_to_native-Swift.h>)
#import <gesture_detector_to_native/gesture_detector_to_native-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "gesture_detector_to_native-Swift.h"
#endif

@implementation GestureDetectorToNativePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [FlutterGestureDetector registerWithRegistrar:registrar];
}
@end
