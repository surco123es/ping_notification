#ifndef FLUTTER_PLUGIN_PING_NOTIFICATION_PLUGIN_H_
#define FLUTTER_PLUGIN_PING_NOTIFICATION_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace ping_notification {

class PingNotificationPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PingNotificationPlugin();

  virtual ~PingNotificationPlugin();

  // Disallow copy and assign.
  PingNotificationPlugin(const PingNotificationPlugin&) = delete;
  PingNotificationPlugin& operator=(const PingNotificationPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace ping_notification

#endif  // FLUTTER_PLUGIN_PING_NOTIFICATION_PLUGIN_H_
