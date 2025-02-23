import 'package:flutter/widgets.dart';

class ChangeConexion extends ChangeNotifier {
  bool _conexion = false;
  bool get conexion => _conexion;
  void change(bool cnx) {
    _conexion = cnx;
    notifyListeners();
  }
}

class ChangeConexionWidget extends InheritedWidget {
  final ChangeConexion conexion;

  const ChangeConexionWidget({
    super.key,
    required this.conexion,
    required super.child,
  });

  static ChangeConexionWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(covariant ChangeConexionWidget oldWidget) {
    return conexion._conexion != oldWidget.conexion._conexion;
  }
}
