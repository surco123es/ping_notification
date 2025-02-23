
# Ping Notification

Ping Notification es una librería de Flutter que permite realizar pings a servidores y recibir notificaciones sobre el estado de la conexión.

## Instalación

Agrega la dependencia en tu archivo `pubspec.yaml`:

```yaml
dependencies:
  ping_notification: ^1.0.0
```

Luego, ejecuta:

```sh
flutter pub get
```

## Uso

Importa la librería en tu archivo Dart:

```dart
import 'package:ping_notification/ping_notification.dart';
```

### Ejemplo Básico

Aquí hay un ejemplo básico de cómo usar la librería en tu aplicación Flutter:

```dart
import 'package:flutter/material.dart';
import 'package:ping_notification/ping_notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final PingNotificationManager pingManager = PingNotificationManager();

  @override
  Widget build(BuildContext context) {
    pingManager.initConfigurationPingNotification(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Text('Running'),
      ),
    );
  }
}
```

### Configuración

Puedes configurar los parámetros del ping utilizando la clase `PingRequire`:

```dart
PingRequire pingConfig = PingRequire(
  host: 'www.google.com',
  okConexion: (ping) {
    print('Conexión exitosa: $ping');
  },
  errorConexion: (ping) {
    print('Error de conexión: $ping');
  },
);
```

### Notificaciones

Para recibir notificaciones sobre el estado de la conexión, utiliza `PingNotificationManager`:

```dart
final PingNotificationManager pingManager = PingNotificationManager();
pingManager.initConfigurationPingNotification(context: context);
```

## Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue o un pull request en el repositorio.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo LICENSE para más detalles.
```
