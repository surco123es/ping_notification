import 'package:network_ping/model/ping_require.dart';

import 'lang_model.dart';

class RequirePingNotification {
  PingCallBack okConexion, errorConexion;
  LangModel lang;
  String host;
  RequirePingNotification({
    required this.okConexion,
    required this.errorConexion,
    required this.lang,
    required this.host,
  });
  static RequirePingNotification def = RequirePingNotification(
      okConexion: (ping) {},
      errorConexion: (ping) {},
      host: 'www.google.com',
      lang: LangModel(
        okConexion: 'Conexion perfecta',
        errorConexion: 'Error en la conexion',
        generalError: 'Un error general',
        redErrorConexion: 'Error de red',
      ));
}
