import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
    required this.message,
    required this.isHuman,
  });

  final String message;
  final bool isHuman;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.03),
          borderRadius: BorderRadius.only(
            topLeft: isHuman ? const Radius.circular(6) : Radius.zero,
            topRight: isHuman ? Radius.zero : const Radius.circular(6),
            bottomLeft: const Radius.circular(6),
            bottomRight: const Radius.circular(6),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.normal,
            height: 18 / 13,
          ),
        ),
      ),
    );
  }
}
