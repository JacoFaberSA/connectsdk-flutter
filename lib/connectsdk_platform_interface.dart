import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'connectsdk_method_channel.dart';

abstract class ConnectsdkPlatform extends PlatformInterface {
  /// Constructs a ConnectsdkPlatform.
  ConnectsdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static ConnectsdkPlatform _instance = MethodChannelConnectsdk();

  /// The default instance of [ConnectsdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelConnectsdk].
  static ConnectsdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ConnectsdkPlatform] when
  /// they register themselves.
  static set instance(ConnectsdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
