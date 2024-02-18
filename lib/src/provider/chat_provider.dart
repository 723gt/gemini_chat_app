import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chatProvider = StateProvider<ChatSession?>((ref) => null);
