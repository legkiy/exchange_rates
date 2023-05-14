import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 34, 33, 48),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
      iconTheme: IconThemeData(color: Colors.white)),
  scaffoldBackgroundColor: const Color.fromARGB(255, 34, 41, 61),
  primarySwatch: Colors.yellow,
  dividerTheme: const DividerThemeData(color: Colors.white12, space: 1),
  listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
      contentPadding: EdgeInsets.only(left: 20, right: 20)),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
    bodySmall: TextStyle(
      color: Color.fromARGB(255, 221, 221, 221),
      fontSize: 18,
    ),
  ),
);
