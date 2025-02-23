import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ping_notification/model/change_conexion.dart';

import '../model/lang_model.dart';

class NotificationWidget extends StatefulWidget {
  final LangModel lang;
  const NotificationWidget({
    super.key,
    required this.lang,
  });

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  bool show = false;
  bool conexion = false;
  Timer? tmer;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ChangeConexionWidget.of(context)?.conexion.addListener(
          () {
            conexion = ChangeConexionWidget.of(context)!.conexion.conexion;
            if (tmer != null) {
              tmer!.cancel();
            }
            if (!conexion) {
              show = true;
            } else {
              tmer = Timer(
                Duration(seconds: 5),
                () {
                  setState(() {
                    show = false;
                  });
                },
              );
            }
            setState(() {});
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (tmer != null) {
      tmer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: show,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: conexion ? Colors.green : Colors.red,
        alignment: Alignment.center,
        child: Text(
          conexion ? widget.lang.okConexion : widget.lang.errorConexion,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
