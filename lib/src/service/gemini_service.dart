import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gemini_ai/src/provider/chat_message_provider.dart';
import 'package:gemini_ai/src/provider/chat_provider.dart';
import 'package:gemini_ai/src/provider/gemini_model_provider.dart';
import 'package:gemini_ai/src/provider/user_provider.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as type;

class GeminiService {
  GeminiService({required this.ref});
  final Ref ref;

  Future<String> sendMessage(type.PartialText pronpt) async {
    final chat = ref.read(chatProvider);
    if (chat == null) {
      return "error";
    }
    final content = Content.text(pronpt.text);
    final response = await chat.sendMessage(content);
    final message = response.text ?? "none";
    return message;
  }

  void startChat() {
    final model = ref.read(geminiModelProvider);
    ref.read(chatProvider.notifier).state = model.startChat();
  }

  type.TextMessage buildMessage(type.User user, String text) {
    final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    final message = type.TextMessage(author: user, text: text, id: timeStamp);

    return message;
  }

  Future<void> onSendPressed(type.PartialText text) async {
    final userMessage = buildMessage(ref.read(userProvider), text.text);
    addMessage(userMessage);
    final responseText = await sendMessage(text);
    final aiMessage = buildMessage(ref.read(aiUserProvider), responseText);
    addMessage(aiMessage);
  }

  void addMessage(type.TextMessage message) {
    final messages = ref.read(chatMessagesProvider);
    ref.read(chatMessagesProvider.notifier).state = [message, ...messages];
  }
}
