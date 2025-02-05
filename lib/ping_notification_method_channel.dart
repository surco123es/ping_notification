import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ping_notification_platform_interface.dart';

/// An implementation of [PingNotificationPlatform] that uses method channels.
class MethodChannelPingNotification extends PingNotificationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ping_notification');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
