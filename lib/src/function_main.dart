import 'package:flutter/material.dart';
import 'package:network_ping/network_ping.dart';
import 'package:ping_notification/model/change_conexion.dart';
import 'package:ping_notification/widget/notification_widget.dart';

import '../model/require_ping.dart';

class PingNotificationManager {
  bool _pingInit = false;
  bool _pingStatusConexion = false;
  final ChangeConexion _controllerConexion = ChangeConexion();
  bool verificarUseMaterial(BuildContext context) {
    return context.findAncestorWidgetOfExactType<MaterialApp>() != null;
  }

  void startPingNotification(PingRequire req) async {
    bool pingReturn = await ping.ping(req);
    if (pingReturn) {
      ping.controller.stream.listen(
        (e) {
          if (!_pingInit || _pingStatusConexion == e.conexion) {
            return;
          }
          if (e.conexion) {
            if (req.okConexion != null) {
              req.okConexion!(e);
            }
          } else {
            if (req.errorConexion != null) {
              req.errorConexion!(e);
            }
          }
          _pingStatusConexion = e.conexion;
          _controllerConexion.change(e.conexion);
        },
      );
    } else {
      print('algo salio mal');
    }
  }

  void initConfigurationPingNotification({
    required BuildContext context,
    RequirePingNotification? notificationRequire,
    bool pingAutomatic = true,
    PingRequire? pingRequire,
  }) {
    if (!verificarUseMaterial(context)) {
      print('use in MaterialApp()');
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        notificationRequire ??= RequirePingNotification.def;

        if (!_pingInit) {
          Overlay.of(context, rootOverlay: true).insert(OverlayEntry(
            builder: (context) => Material(
              type: MaterialType.transparency,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 50,
                    child: ChangeConexionWidget(
                      conexion: _controllerConexion,
                      child: NotificationWidget(
                        lang: notificationRequire!.lang,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
          _pingInit = true;
          if (pingAutomatic) {
            startPingNotification(pingRequire ?? PingRequire.pingDefault);
          }
        }
      },
    );
  }
}
