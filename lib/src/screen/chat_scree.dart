import 'package:flutter/material.dart';
import 'package:gemini_ai/src/provider/chat_message_provider.dart';
import 'package:gemini_ai/src/provider/gemini_service_provider.dart';
import 'package:gemini_ai/src/provider/user_provider.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as type;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key});
  final user = const type.User(id: 'human');
  final ai = const type.User(id: 'ai');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(geminiServiceProvider).startChat();
      });
      return null;
    }, []);

    return Scaffold(
      body: Chat(
          user: ref.read(userProvider),
          messages: ref.watch(chatMessagesProvider),
          onSendPressed: ref.read(geminiServiceProvider).onSendPressed),
    );
  }
}
