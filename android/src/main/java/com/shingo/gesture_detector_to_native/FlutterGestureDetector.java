package com.shingo.gesture_detector_to_native;

import androidx.annotation.NonNull;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** GestureDetectorToNativePlugin */
public class FlutterGestureDetector implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  private Map<String,GestureDetectorListener> _listener = new HashMap<String,GestureDetectorListener>();

  static FlutterGestureDetector _instance;


  public static FlutterGestureDetector instance() {
    if(_instance==null){
      _instance = new FlutterGestureDetector();
    }
    return _instance;
  }


  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "gesture_detector_to_native");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if("GestureDetectorEventDetail".equals(call.method)){
      if(call.arguments==null||_instance._listener.isEmpty()){
        return;
      }

      String tag = call.argument("tag");
      if(!_instance._listener.containsKey(tag)){
        return;
      }

      Map<String,Object> detail = call.argument("detail");
      if("onHorizontalDragStart".equals(detail.get("name"))){
        _instance._listener.get("tag").onHorizontalDragStart();
      }else if("onHorizontalDragUpdate".equals(detail.get("name"))) {
        _instance._listener.get("tag").onHorizontalDragUpdate((Double) detail.get("value"));
      }else if("onHorizontalDragEnd".equals(detail.get("name"))){
        _instance._listener.get("tag").onHorizontalDragEnd((Double) detail.get("value"));
      }
    }
  }





  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
