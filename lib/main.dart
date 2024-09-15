import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_gemini_chat/chat_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final geminiAPIKey = dotenv.env['GEMINI_API_KEY'];
  if (geminiAPIKey == null) {
    throw Exception('Please provide your Gemini API key in the .env file');
  }

  Gemini.init(apiKey: geminiAPIKey);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gemini Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChatPage(),
    );
  }
}
