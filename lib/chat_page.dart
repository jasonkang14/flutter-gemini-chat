import 'package:flutter/material.dart';
import 'package:flutter_gemini_chat/ai_message.dart';
import 'package:flutter_gemini_chat/human_message.dart';

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
            width: 1.0,
          ),
        ),
        title: const Text(
          'Gemini',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
        child: Column(
          children: [
            AIMessage(
                content:
                    'Really love your most recent photo. I\'ve been trying to capture the same thing for a few months and would love some tips!'),
            SizedBox(height: 24),
            HumanMessage(
                content:
                    'A fast 50mm like f1.8 would help with the bokeh. I\'ve been using primes as they tend to get a bit sharper images.'),
          ],
        ),
      ),
    );
  }
}