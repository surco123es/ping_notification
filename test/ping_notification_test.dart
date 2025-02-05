import 'package:flutter_test/flutter_test.dart';
import 'package:ping_notification/ping_notification.dart';
import 'package:ping_notification/ping_notification_platform_interface.dart';
import 'package:ping_notification/ping_notification_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPingNotificationPlatform
    with MockPlatformInterfaceMixin
    implements PingNotificationPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PingNotificationPlatform initialPlatform = PingNotificationPlatform.instance;

  test('$MethodChannelPingNotification is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPingNotification>());
  });

  test('getPlatformVersion', () async {
    PingNotification pingNotificationPlugin = PingNotification();
    MockPingNotificationPlatform fakePlatform = MockPingNotificationPlatform();
    PingNotificationPlatform.instance = fakePlatform;

    expect(await pingNotificationPlugin.getPlatformVersion(), '42');
  });
}
