package com.shingo.gesture_detector_to_native;

public interface GestureDetectorListener {

    void onHorizontalDragStart();

    void onHorizontalDragUpdate(double dx);


    void onHorizontalDragEnd(double velocity);
}
