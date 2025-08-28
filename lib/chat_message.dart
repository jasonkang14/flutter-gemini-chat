import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
    required this.content,
    required this.isUser,
  });

  final String content;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    final double maxBubbleWidth = MediaQuery.of(context).size.width * 0.7;

    return Flexible(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxBubbleWidth),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.03),
            borderRadius: BorderRadius.only(
              topLeft: isUser ? Radius.zero : const Radius.circular(6),
              topRight: isUser ? const Radius.circular(6) : Radius.zero,
              bottomRight: const Radius.circular(6),
              bottomLeft: const Radius.circular(6),
            ),
          ),
          child: SelectableText(
            content,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              height: 18 / 13,
            ),
          ),
        ),
      ),
    );
  }
}
