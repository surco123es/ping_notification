
import 'ping_notification_platform_interface.dart';

class PingNotification {
  Future<String?> getPlatformVersion() {
    return PingNotificationPlatform.instance.getPlatformVersion();
  }
}
