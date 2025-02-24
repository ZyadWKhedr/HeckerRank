import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(path: "/", builder: (context, state) => SplashScreen()),
      GoRoute(path: "/onboarding", builder: (context, state) => OnboardingScreen()),
      GoRoute(path: "/login", builder: (context, state) => LoginScreen()),
      GoRoute(path: "/signup", builder: (context, state) => SignupScreen()),
    ],
  );
});
