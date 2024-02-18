import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as type;

final chatMessagesProvider = StateProvider<List<type.Message>>((ref) => []);
