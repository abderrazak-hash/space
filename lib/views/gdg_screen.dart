import 'dart:async';

import 'package:flutter/material.dart';
import 'package:space/views/custom_paints/gdg_logo.dart';

class GdgScreen extends StatefulWidget {
  const GdgScreen({super.key});

  @override
  State<GdgScreen> createState() => _GdgScreenState();
}

class _GdgScreenState extends State<GdgScreen> with TickerProviderStateMixin {
  late Timer timer;
  int time = -1;

  void initTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (time < 4) {
        setState(() {
          time++;
        });
      } else {
        setState(() {
          time = -1;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: const Size(140, 75),
        painter: GDGLogo(time: time),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}
