import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: const Border(
          bottom: BorderSide(
            color: Color(0xFF656565),
            width: 1,
          ),
        ),
        title: const Text(
          'Gemini',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            height: 22 / 17,
          ),
        ),
      ),
    );
  }
}
