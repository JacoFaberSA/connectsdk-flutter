package com.ptsportsuite.connectsdk;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** ConnectsdkPlugin */
public class ConnectsdkPlugin implements FlutterPlugin, MethodCallHandler, ConnectableDeviceListener {
  /// The MethodChannel that will the communication between Flutter and native
  /// Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine
  /// and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  private DevicePicker mDevicePicker;
  private ConnectableDevice mDevice;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "connectsdk");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("init")) {
      DiscoveryManager.init(getApplicationContext());
      CapabilityFilter imageFilter = new CapabilityFilter(MediaPlayer.Display_Image);

      DiscoveryManager.getInstance().setCapabilityFilters(imageFilter);
      DiscoveryManager.getInstance().start();
      
      mDevicePicker = new DevicePicker(this);
    } else if(all.method.equals("showPicker")) {
      result.notImplemented();
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
