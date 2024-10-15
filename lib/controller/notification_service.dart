import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notifications_app/page/home_page.dart';
import 'package:notifications_app/page/message.dart';

import '../main.dart';

class NotificationService {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future init() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true
    );
  }

  static Future localNotificationInit() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid
    );

    _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();
    
    _flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: onNotificationTap, onDidReceiveBackgroundNotificationResponse: onNotificationTap);
  }

  static void onNotificationTap(NotificationResponse notificatonResponse) {
    navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => MessagePage()));
  }

  static Future showSimpleNotification({required String title, required String body}) async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails('channel_id', 'channel_name', channelDescription: 'test', importance: Importance.max, priority: Priority.high, ticker: 'ticker');

    const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

    await _flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails);
  }
}