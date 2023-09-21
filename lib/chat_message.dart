import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {Key? key,
      required this.text,
      required this.sender,
      required this.isBot});

  final String text;
  final String sender;
  final bool isBot;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16.0, bottom: 20.0),
          child: CircleAvatar(
            backgroundImage:
                AssetImage(isBot ? 'assets/AI.png' : 'assets/user.png'),
            radius: 25, // Set the radius of the circular avatar
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sender,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text),
              )
            ],
          ),
        )
      ],
    );
  }
}
