import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final geminiModelProvider = Provider<GenerativeModel>((ref) {
  final apiKey = dotenv.get('API_KEY');
  return GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
});
