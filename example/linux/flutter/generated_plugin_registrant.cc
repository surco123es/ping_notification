//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <ping_notification/ping_notification_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) ping_notification_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PingNotificationPlugin");
  ping_notification_plugin_register_with_registrar(ping_notification_registrar);
}
