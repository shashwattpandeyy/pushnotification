import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initialise() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings('app_icon'));
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static void display(RemoteMessage message) async {
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
            "shashwat", "shashwat channel", "this is channel",
            importance: Importance.max, priority: Priority.high));

    await _flutterLocalNotificationsPlugin.show(id, message.notification!.title,
        message.notification!.title, notificationDetails);
  }
}
