#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint gesture_detector_to_native.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'gesture_detector_to_native'
  s.version          = '0.0.1'
  s.summary          = 'flutter手势事件传递到原生'
  s.description      = <<-DESC
flutter手势事件传递到原生
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386','BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' }
  s.swift_version = '5.0'
end
