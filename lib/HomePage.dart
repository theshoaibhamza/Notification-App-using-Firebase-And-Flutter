// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, file_names, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_final_fields, sort_child_properties_last, unused_import, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, non_constant_identifier_names, unnecessary_import, avoid_unnecessary_containers, duplicate_ignore, sized_box_for_whitespace, camel_case_types, unused_local_variable, must_be_immutable

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notification_app/Widgets/BoldText.dart';
import 'package:notification_app/Widgets/LightText.dart';
import 'package:notification_app/Widgets/ResponsiveButton.dart';
import 'package:notification_app/chatPage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  RemoteMessage? message;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("AI Chat-Bot APP")),
        ),
        body: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      //color: Colors.red,
                      margin: EdgeInsets.only(top: 60, left: 20, right: 20),
                      child: BoldText(
                        text: "Your AI Assistent",
                        size: 40,
                        color: Colors.blue.withOpacity(1),
                        font: "font11",
                      )),
                  Container(
                      height: 130,
                      width: 470,
                      //color: Colors.red,
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: LightText(
                        text:
                            "Using this application you can \neasily chat with your own chat-bot\nand even you can send and receive \narticles in seconds.",
                        size: 20,
                        font: "font23",
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),

            // image

            Container(
              child: Image.asset("assets/a.jpg"),
            ),

            SizedBox(
              height: 40,
            ),
            Transform.translate(
              offset: Offset(0, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatPage()));
                },
                child: Container(
                  height: 50,
                  width: 170,
                  child: Center(
                      child: BoldText(
                    text: "Continue",
                    font: "font11",
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.withOpacity(0.8),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
