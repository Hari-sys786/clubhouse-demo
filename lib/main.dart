import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ClubhouseApp());
}

class ClubhouseApp extends StatelessWidget {
  const ClubhouseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clubhouse Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C5CE7),
          brightness: Brightness.light,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
