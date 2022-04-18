import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
    this.message,
    this.isMe, {
    required this.key,
  });

  final bool isMe;
  // added key per message for better rendering
  final Key key;

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
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
              bottomRight:
                  isMe ? const Radius.circular(0) : const Radius.circular(12.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          width: 130,
          margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isMe
                  ? Colors.black
                  : Theme.of(context).accentTextTheme.headline1!.color,
            ),
          ),
        ),
      ],
    );
  }
}
