import 'package:flutter/material.dart';

import 'gesture_detector_to_native_channel.dart';

class GestureDetectorToNative extends StatefulWidget {
  ///标识,原生端用来区分来源
  final String tag;
  final Widget? child;
  final HitTestBehavior? behavior;

  const GestureDetectorToNative({Key? key, required this.tag, this.child, this.behavior}) : super(key: key);

  @override
  State<GestureDetectorToNative> createState() => _GestureDetectorToNativeState();
}

class _GestureDetectorToNativeState extends State<GestureDetectorToNative> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.child,
      behavior: widget.behavior,
      onHorizontalDragStart: (_) {
        _handleGestureDetectorEventToNative(GestureDetectorEventDetail(name: "onHorizontalDragStart"));
      },
      onHorizontalDragUpdate: (detail) {
        _handleGestureDetectorEventToNative(GestureDetectorEventDetail(name: "onHorizontalDragUpdate", value: detail.delta.dx));
      },
      onHorizontalDragEnd: (detail) {
        _handleGestureDetectorEventToNative(GestureDetectorEventDetail(name: "onHorizontalDragEnd", value: detail.primaryVelocity));
      },

    );
  }

  _handleGestureDetectorEventToNative(GestureDetectorEventDetail detail) {
    GestureDetectorToNativeChannel.handleGestureDetectorEventToNative(widget.tag, detail);
  }
}
