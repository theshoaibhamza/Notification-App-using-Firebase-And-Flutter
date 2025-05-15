// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, file_names, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_final_fields, sort_child_properties_last, unused_import, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, non_constant_identifier_names, unnecessary_import, avoid_unnecessary_containers, duplicate_ignore, sized_box_for_whitespace, camel_case_types, unused_local_variable, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:notification_app/Message.dart';
import 'package:notification_app/Widgets/BoldText.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> msg = [];

  TextEditingController _textEditingController = TextEditingController();

  callGeminiModel() async {
    try {
      if (_textEditingController.text.isNotEmpty) {
        msg.add(Message(text: _textEditingController.text, isUser: true));
      }

      final model = GenerativeModel(
          model: 'gemini-pro', apiKey: dotenv.env['GOOGLE_API_KEY']!);
      final prompt = _textEditingController.text.trim();
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      setState(() {
        msg.add(Message(text: response.text!, isUser: false));
      });
      _textEditingController.clear();
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: AssetImage(
                "assets/1.png",
              ))),
        ),
        SizedBox(
          width: 10,
        ),
        BoldText(
          text: "AI Chat-Bot",
          font: "font11",
          size: 22,
        )
      ])),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: msg.length,
                itemBuilder: ((context, index) {
                  final eachMessage = msg[index];
                  return ListTile(
                    title: Align(
                      alignment: eachMessage.isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                          decoration: BoxDecoration(
                            color: eachMessage.isUser
                                ? Colors.blue.withOpacity(0.8)
                                : Colors.grey.withOpacity(0.4),
                            borderRadius: eachMessage.isUser
                                ? BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20))
                                : BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                          ),
                          padding: EdgeInsets.all(10),
                          child: BoldText(text: eachMessage.text)),
                    ),
                  );
                })),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        offset: Offset(0, 3)),
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Click here to Chat..!"),
                    ),
                  ),
                  IconButton(onPressed: callGeminiModel, icon: Icon(Icons.send))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
