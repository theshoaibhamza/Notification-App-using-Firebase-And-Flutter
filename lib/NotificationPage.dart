// ignore_for_file: must_be_immutable

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Notificationpage extends StatelessWidget {
  Notificationpage({super.key, required this.message});
  RemoteMessage message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Column(
        children: [
          Text(message.notification!.title.toString()),
          Text(message.notification!.body.toString()),
        ],
      ),
    );
  }
}
