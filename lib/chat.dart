import 'package:flutter/material.dart';
import 'package:flutter_gemini_chat/ai_message.dart';
import 'package:flutter_gemini_chat/human_message.dart';
import 'package:flutter_svg/svg.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        child: Column(
          children: [
            const AIMessage(
                content:
                    'Really love your most recent photo. I\'ve been trying to capture the same thing for a few months and would love some tips!'),
            const SizedBox(height: 24),
            const HumanMessage(
                content:
                    'A fast 50mm like f1.8 would help with the bokeh. I\'ve been using primes as they tend to get a bit sharper images.'),
            Row(
              children: [
                const TextField(),
                const SizedBox(width: 8),
                IconButton(
                  icon: SvgPicture.asset('assets/icons/send-chat.svg'),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
