import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(8.0),
          child: const Text('This works!'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/hKPepyvaxsIWdmiMcnfJ/messages')
              .snapshots()
              .listen((data) {
            data.docs.forEach((document) {
              print(document['text']);
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
