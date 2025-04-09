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
  final chatController = TextEditingController();
  List<Content> chatList = [];
  final gemini = Gemini.instance;

  Future<void> handleChatMessage(String newMessage) async {
    chatController.clear();

    setState(() {
      chatList = [
        ...chatList,
        // Content(role: 'user', parts: [Parts(text: newMessage)]) 기존 2.x 버전
        Content(role: 'user', parts: [Part.text(newMessage)]) // 3.x 버전
      ];
    });

    try {
      final value = await gemini.chat(chatList);

      setState(() {
        chatList = [
          ...chatList,
          // Content(role: 'model', parts: [Parts(text: value?.output)]) //기존 2.x 버전
          Content(role: 'model', parts: [Part.text(value?.output ?? '')]) // 3.x 버전
        ];
      });
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
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: chatList.length,
                separatorBuilder: (context, index) => const SizedBox(height: 24),
                itemBuilder: (context, index) {
                  final chat = chatList[index];
                  Widget messageWidget = chat.role == 'user'
                      ? HumanMessage(content: chat.parts?.first is TextPart ? (chat.parts?.first as TextPart).text : '')
                      : AIMessage(content: chat.parts?.first is TextPart ? (chat.parts?.first as TextPart).text : '');
                  return messageWidget;
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: chatController,
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
                  onPressed: () async => handleChatMessage(chatController.text),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
