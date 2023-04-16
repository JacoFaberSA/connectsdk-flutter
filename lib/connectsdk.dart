
import 'connectsdk_platform_interface.dart';

class Connectsdk {
  Future<String?> getPlatformVersion() {
    return ConnectsdkPlatform.instance.getPlatformVersion();
  }
}
