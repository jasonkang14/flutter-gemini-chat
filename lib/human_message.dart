import 'package:flutter/material.dart';
import 'package:flutter_gemini_chat/chat_message.dart';

class HumanMessage extends StatelessWidget {
  const HumanMessage({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChatMessage(content: content),
        const SizedBox(width: 16),
        Image.asset('assets/images/human.png'),
      ],
    );
  }
}
