import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.0;

    final path = Path();
    const dashWidth = 5.0; 
    const dashSpace = 5.0; 

    double x = 0;
    while (x < size.width) {
      path.moveTo(x, size.height / 2);
      x += dashWidth;
      path.lineTo(x, size.height / 2);
      x += dashSpace;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}