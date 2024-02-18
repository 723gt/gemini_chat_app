import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';

final userProvider = Provider<User>((ref) => const User(id: 'user'));
final aiUserProvider = Provider((ref) => const User(id: 'ai'));
