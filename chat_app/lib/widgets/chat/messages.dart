import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app/widgets/chat/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final firebaseAuth = FirebaseAuth.instance; 
    // final User? user;
    // user = firebaseAuth.currentUser;

    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (ctx, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting){
          return const Center(
              child: CircularProgressIndicator(),
            );
        }
      return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy(
              'createAt',
              descending: true,
            )
            .snapshots(),
        builder: (context, chatSnapshot) {  
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final chatDocs = chatSnapshot.data!.documents;
          return ListView.builder(
            // makes all the content at the bottom
            reverse: true,
            itemCount: chatDocs.length,
            itemBuilder: (context, index) {
                return MessageBubble(
                  chatDocs[index]['text'], 
                  chatDocs[index]['userId'] == futureSnapshot.data!.uid,
                  key: ValueKey(chatDocs[index]['documentID'],
                ),
                );
            }
          );
        },
      ),
      }
    );
  }
}
