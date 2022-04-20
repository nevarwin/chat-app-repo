import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
    this.message,
    this.username,
    this.userImage,
    this.isMe, {
    required this.key,
  });

  final bool isMe;
  // added key per message for better rendering
  final Key key;
  final String username;
  final String userImage;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topRight: const Radius.circular(12.0),
                  topLeft: const Radius.circular(12.0),
                  bottomLeft: !isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(12.0),
                  bottomRight: isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(12.0),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              width: 130,
              margin: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 8,
              ),
              child: Column(
                mainAxisAlignment:
                    isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  // usernames
                  Text(
                    username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isMe
                          ? Colors.black
                          : Theme.of(context).accentTextTheme.headline1!.color,
                    ),
                  ),
                  // messages
                  Text(
                    message,
                    style: TextStyle(
                      color: isMe
                          ? Colors.black
                          : Theme.of(context).accentTextTheme.headline1!.color,
                    ),
                    textAlign: isMe ? TextAlign.right : TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: isMe ? null : 120,
          right: isMe ? 120 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              userImage,
            ),
          ),
        ),
      ],
    );
  }
}
