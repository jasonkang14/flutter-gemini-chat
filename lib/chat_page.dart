import 'package:flutter/material.dart';
import 'package:flutter_basics/ai_message.dart';
import 'package:flutter_basics/human_message.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_svg/svg.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _chatController = TextEditingController();
  final gemini = Gemini.instance;
  List<Content> _chatList = [];

  void handleNewChat(String newChat) async {
    setState(() {
      _chatList = [
        ..._chatList,
        Content(
          role: 'user',
          parts: [
            Parts(text: newChat),
          ],
        ),
      ];
    });
    _chatController.clear();
    final aiResponse = await gemini.chat(_chatList);
    debugPrint('airesponse.output: ${aiResponse?.output}');
    setState(() {
      _chatList = [
        ..._chatList,
        Content(
          role: 'model',
          parts: [
            Parts(text: aiResponse?.output),
          ],
        ),
      ];
    });
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
                itemBuilder: (context, index) {
                  return _chatList[index].role == 'model'
                      ? AIMessage(message: _chatList[index].parts?.first.text ?? '')
                      : HumanMessage(message: _chatList[index].parts?.first.text ?? '');
                },
                separatorBuilder: (context, index) => const SizedBox(height: 24),
                itemCount: _chatList.length,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _chatController,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 24 / 14,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFF7F7FC),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      hintText: 'Add a message',
                    ),
                    onSubmitted: handleNewChat,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () => handleNewChat(_chatController.text),
                  icon: SvgPicture.asset('assets/icons/send-chat.svg'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
