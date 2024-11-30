import 'package:flutter/material.dart';
import 'package:test_project/constants/app_colors.dart';

class SemiCircularGradientPainter extends CustomPainter {
  final bool topLeft;

  SemiCircularGradientPainter({required this.topLeft});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const RadialGradient(
        colors: [
          AppColors.purpleColor,
          AppColors.blackColor,
          // AppColors.ligtPurple,
        ],
        stops: [0.5, 1.0],
      ).createShader(Rect.fromCircle(
        center: topLeft
            ? const Offset(80, 0)
            : Offset(
          size.width - size.width /4,
          size.height -115,
              ),
        radius: size.width / 2,
      ));

    canvas.drawCircle(
      topLeft
          ? const Offset(80, 0)
          : Offset(
        size.width - size.width /4,
        size.height -115,
            ),
      size.width / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
