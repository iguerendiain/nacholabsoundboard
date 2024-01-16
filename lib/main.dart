import 'package:flutter/material.dart';
import 'package:nacholab_soundboard/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NachoLab\'s SoundBoard',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(35, 45, 85, 1))
      ),
      home: const MyHomePage()
    );
  }
}
