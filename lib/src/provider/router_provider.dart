import 'package:flutter/widgets.dart';
import 'package:gemini_ai/src/screen/chat_scree.dart';
import 'package:gemini_ai/src/screen/hoom_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (context, state) => const HoomScreen(),
        routes: <RouteBase>[
          GoRoute(
            path: 'chat',
            builder: (context, state) => const ChatScreen(),
          )
        ]),
  ]);
});
