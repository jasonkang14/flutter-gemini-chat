import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_gemini_chat/ai_message.dart';
import 'package:flutter_gemini_chat/human_message.dart';
import 'package:flutter_svg/svg.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _chatController = TextEditingController();
  final chatList = <Content>[];
  final gemini = Gemini.instance;

  Future<void> handleChatMessage(String newMessage) async {
    _chatController.clear();
    chatList.add(Content(role: 'user', parts: [Parts(text: newMessage)]));
    setState(() {});

    try {
      final value = await gemini.chat(chatList);
      chatList.add(Content(role: 'model', parts: [Parts(text: value?.output)]));
      setState(() {});
    } catch (error) {
      debugPrint('Error: $error');
    }
  }

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 74),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: chatList.map((chat) {
                  Widget messageWidget = chat.role == 'user'
                      ? HumanMessage(content: chat.parts?.first.text ?? '')
                      : AIMessage(content: chat.parts?.first.text ?? '');
                  return Column(
                    children: [
                      messageWidget,
                      const SizedBox(height: 24),
                    ],
                  );
                }).toList(),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _chatController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      hintStyle: const TextStyle(
                        color: Color(0xFF656565),
                        fontSize: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF7F7FC),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    ),
                    onSubmitted: handleChatMessage,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: SvgPicture.asset('assets/icons/send-chat.svg'),
                  onPressed: () async => handleChatMessage(_chatController.text),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
