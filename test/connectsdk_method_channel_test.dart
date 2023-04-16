import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:connectsdk/connectsdk_method_channel.dart';

void main() {
  MethodChannelConnectsdk platform = MethodChannelConnectsdk();
  const MethodChannel channel = MethodChannel('connectsdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
