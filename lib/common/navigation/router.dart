import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_match_game/common/navigation/routes.dart';
import 'package:memory_match_game/features/game_manager/ui/pages/startup_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const StartUpPage(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);
