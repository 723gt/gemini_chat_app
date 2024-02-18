import 'package:gemini_ai/src/service/gemini_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final geminiServiceProvider = Provider((ref) => GeminiService(ref: ref));
