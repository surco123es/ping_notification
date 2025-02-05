import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ping_notification_method_channel.dart';

abstract class PingNotificationPlatform extends PlatformInterface {
  /// Constructs a PingNotificationPlatform.
  PingNotificationPlatform() : super(token: _token);

  static final Object _token = Object();

  static PingNotificationPlatform _instance = MethodChannelPingNotification();

  /// The default instance of [PingNotificationPlatform] to use.
  ///
  /// Defaults to [MethodChannelPingNotification].
  static PingNotificationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PingNotificationPlatform] when
  /// they register themselves.
  static set instance(PingNotificationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
