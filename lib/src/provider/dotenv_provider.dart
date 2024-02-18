import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dotEnvProvider = FutureProvider<DotEnv>((ref) async {
  await dotenv.load(fileName: ".env");
  return dotenv;
});
