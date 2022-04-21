import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:chat_app/widgets/chat/messages.dart';
import 'package:chat_app/widgets/chat/new_messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((message) {
      print(message);
    });
    FirebaseMessaging.onBackgroundMessage((message) {
      final msg = print(message);
      return msg as Future<void>;
    });

    final fbm = FirebaseMessaging.instance;
    fbm.requestPermission();
    fbm.getInitialMessage();
    // refering to the chat in firestore database
    fbm.subscribeToTopic('chat');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
      ),
      body: Column(
        children: const [
          Expanded(
            child: Messages(),
          ),
          NewMessages(),
        ],
      ),
    );
  }
}
