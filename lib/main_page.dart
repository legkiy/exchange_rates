import 'package:flutter/material.dart';
import 'main_theme/dart_theme.dart';
import 'router/router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exchange Rates',
      theme: darkTheme,
      routes: routes,
    );
  }
}
