import 'package:flutter/material.dart';
import 'package:space/views/gdg_screen.dart';
import 'package:space/views/space_background.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SpaceApp(),
    ),
  );
}

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          SpaceBackground(),
          GdgScreen(),
        ],
      ),
    );
  }
}
