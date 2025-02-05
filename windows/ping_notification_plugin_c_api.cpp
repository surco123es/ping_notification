#include "include/ping_notification/ping_notification_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "ping_notification_plugin.h"

void PingNotificationPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  ping_notification::PingNotificationPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
