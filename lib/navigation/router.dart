import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoist/splash.dart';

RouterConfig<Object> router() {
  return GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
  ]);
}
