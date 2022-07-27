import 'dart:async';

import 'package:flutter/services.dart';

class GestureDetectorEventDetail {
  ///事件名称
  final String name;

  ///事件值
  final dynamic value;

  GestureDetectorEventDetail({required this.name, this.value});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "value": value,
    };
  }
}

class GestureDetectorToNativeChannel {
  GestureDetectorToNativeChannel._();

  static const MethodChannel _channel = MethodChannel('gesture_detector_to_native');

  static void handleGestureDetectorEventToNative(String tag, GestureDetectorEventDetail detail) {
    _channel.invokeMapMethod("GestureDetectorEventDetail", {"tag": tag, "detail": detail.toMap()});
  }
}
