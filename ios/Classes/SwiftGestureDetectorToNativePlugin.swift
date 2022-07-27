import Flutter
import UIKit

public class FlutterGestureDetector: NSObject, FlutterPlugin {
    
  
  public static let shared = FlutterGestureDetector()
    
    
  private  var  _listener:Dictionary<String,GestureDetectorListener> = Dictionary.init();
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "gesture_detector_to_native", binaryMessenger: registrar.messenger())
    let instance = FlutterGestureDetector()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
    


  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      
      if(call.method == "GestureDetectorEventDetail"){
          
          let dic = call.arguments as? Dictionary<String,Any>
          
          if(dic == nil || FlutterGestureDetector.shared._listener.isEmpty){
              return
          }
          
          
          let tag = dic!["tag"] as! String
          let detail = dic!["detail"] as? Dictionary<String,Any>
          
          if(detail?["name"] as? String == "onHorizontalDragStart"){
              FlutterGestureDetector.shared._listener[tag]?.onHorizontalDragStart()
          }
          
          else if(detail?["name"]  as? String == "onHorizontalDragUpdate"){
              FlutterGestureDetector.shared._listener[tag]?.onHorizontalDragUpdate((detail?["value"] as? Double ?? 0) )
          }
          
          else if(detail?["name"] as? String == "onHorizontalDragEnd"){
              FlutterGestureDetector.shared._listener[tag]?.onHorizontalDragEnd((detail?["value"] as? Double ?? 0) )
          }
          
      }
  }
    
    public  func addListener(_ tag:String,_ listener:GestureDetectorListener){
        FlutterGestureDetector.shared._listener[tag] = listener;
    }
 
    
    public  func removeListener(_ tag:String){
        FlutterGestureDetector.shared._listener.removeValue(forKey: tag)
    }
    
    
}

public protocol GestureDetectorListener{
    

    func onHorizontalDragStart()
    
    func onHorizontalDragUpdate(_ dx:Double)
    
    
    func onHorizontalDragEnd(_ velocity:Double)
    
}

