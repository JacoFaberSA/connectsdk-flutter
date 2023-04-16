import 'package:flutter_test/flutter_test.dart';
import 'package:connectsdk/connectsdk.dart';
import 'package:connectsdk/connectsdk_platform_interface.dart';
import 'package:connectsdk/connectsdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockConnectsdkPlatform
    with MockPlatformInterfaceMixin
    implements ConnectsdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ConnectsdkPlatform initialPlatform = ConnectsdkPlatform.instance;

  test('$MethodChannelConnectsdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelConnectsdk>());
  });

  test('getPlatformVersion', () async {
    Connectsdk connectsdkPlugin = Connectsdk();
    MockConnectsdkPlatform fakePlatform = MockConnectsdkPlatform();
    ConnectsdkPlatform.instance = fakePlatform;

    expect(await connectsdkPlugin.getPlatformVersion(), '42');
  });
}
