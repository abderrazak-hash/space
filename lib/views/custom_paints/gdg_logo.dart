import 'package:flutter/material.dart';
import 'package:space/colors.dart';

class GDGLogo extends CustomPainter {
  final int time;

  GDGLogo({required this.time});

  @override
  void paint(Canvas canvas, Size size) async {
    var paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = 20.0;

    final center = Offset(size.width / 2, size.height / 2);
    final hr = center.dx;
    final vr = center.dy;

    var path = Path();

    if (time > 0) {
      paint.color = yellow;
      path = Path()
        ..moveTo(center.dx + 20, center.dy + vr)
        ..lineTo(center.dx + hr, center.dy); // Bottom point
      canvas.drawPath(path, paint);
    }

    if (time > 1) {
      paint.color = green;
      path = Path();
      path
        ..moveTo(center.dx + hr, center.dy) // Top point
        ..lineTo(center.dx + 20, center.dy - vr); // Right point
      canvas.drawPath(path, paint);
    }

    if (time > 2) {
      paint.color = blue;
      path = Path()
        ..moveTo(center.dx - 20, center.dy - vr)
        ..lineTo(center.dx - hr, center.dy); // Bottom point
      canvas.drawPath(path, paint);
    }

    if (time > 3) {
      paint.color = red;
      path = Path()
        ..moveTo(center.dx - hr, center.dy)
        ..lineTo(center.dx - 20, center.dy + vr); // Bottom point
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
