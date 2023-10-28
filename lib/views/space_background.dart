import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:space/views/custom_paints/space_painter.dart';

class SpaceBackground extends StatefulWidget {
  const SpaceBackground({super.key});

  @override
  State<SpaceBackground> createState() => _SpaceBackgroundState();
}

class _SpaceBackgroundState extends State<SpaceBackground> {
  late Timer timer;
  double delta = 0;
  FragmentShader? shader;

  void loadSpace() async {
    var program = await FragmentProgram.fromAsset('assets/space.frag');
    shader = program.fragmentShader();
    setState(() {});

    timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {
        delta += 1 / 60;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadSpace();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: CustomPaint(
        painter: SpacePainter(shader!, delta),
      ),
    );
  }
}
