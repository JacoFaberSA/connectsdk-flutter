import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'connectsdk_platform_interface.dart';

/// An implementation of [ConnectsdkPlatform] that uses method channels.
class MethodChannelConnectsdk extends ConnectsdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('connectsdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
