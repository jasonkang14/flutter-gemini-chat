# Gemini Chat Application

This is a Flutter chat application using the [flutter_gemini](https://pub.dev/packages/flutter_gemini) package. It allows users to send messages and receive responses from a Gemini-based AI model.

## Features

- Clean and modern UI for chat interaction
- Text input with send button functionality
- Dynamic display of chat messages from both user and AI
- Error handling in case of network or response issues
- Scrollable chat history
- Light theme with simple design

## Requirements

- Flutter SDK (>=3.0.0)
- Dart SDK (>=2.17.0)

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/jasonkang14/flutter-gemini-chat.git
    cd flutter-gemini-chat
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

3. Run the app:
    ```bash
    flutter run
    ```

## Usage

1. Open the app on your emulator or device.
2. Type a message into the text field.
3. Press the send button or submit the text, and you will receive a response from the Gemini model.
4. Scroll to see the conversation history.

## File Overview

- `lib/main.dart`: Entry point of the application.
- `lib/chat_page.dart`: Contains the main UI for the chat page.
- `lib/ai_message.dart`: UI component for displaying messages from the AI.
- `lib/human_message.dart`: UI component for displaying messages from the user.
- `lib/chat_message.dart`: Shared logic or structure for handling chat messages.

