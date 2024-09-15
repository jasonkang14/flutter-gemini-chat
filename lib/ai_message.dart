import 'package:flutter/material.dart';
import 'package:flutter_gemini_chat/chat_message.dart';

class AIMessage extends StatelessWidget {
  const AIMessage({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/ai.png',
        ),
        const SizedBox(width: 16),
        ChatMessage(content: content),
      ],
    );
  }
}
