// ignore_for_file: unused_import, file_names, non_constant_identifier_names, duplicate_ignore, prefer_interpolation_to_compose_strings

import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/material.dart";
import "package:notification_app/NotificationPage.dart";
import "package:notification_app/main.dart";

class MesssageApi {
  // object
  final MessageObject = FirebaseMessaging.instance;

  // Function

  Future<void> GenerateToken() async {
    // requesting the permission
    await MessageObject.requestPermission();
    // Fetch the token from the device
    final Token = await MessageObject.getToken();

    // ignore: avoid_print
    print("Your tokken : " + Token.toString());
    NotificationSettings();
  }

  // handling

  void handleMessage(RemoteMessage? message) {
    if (message == null) {
      return;
    } else {
      NavKey.currentState?.push(MaterialPageRoute(
          builder: (context) => Notificationpage(
                message: message,
              )));
    }
  }

  Future NotificationSettings() async {
    // when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleMessage(message);
    });

    // when app is in foreground

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("You have received the message : " +
          message.notification!.title.toString());
    });
  }
}
