import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_style.dart';

class GradientElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const GradientElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.purpleColor,
            AppColors.ligtPurple,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Text(
            text,
            style: body20MediumTextStyle,
          ),
        ),
      ),
    );
  }
}
