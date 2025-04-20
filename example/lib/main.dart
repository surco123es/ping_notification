import 'package:flutter/material.dart';
import 'package:ping_notification/model/require_ping.dart';
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
    pingManager.initConfigurationPingNotification(
      context: context,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Text('Runing'),
      ),
    );
  }
}
