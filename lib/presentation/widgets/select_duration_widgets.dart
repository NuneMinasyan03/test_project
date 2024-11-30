import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_style.dart';

class SelectDuration extends StatelessWidget {
  final int duration;
  final String title;
  final String description;
  final String price;
  final String? oldPrice;

  final bool isSelected;
  final ValueChanged<int?> onChanged;

  const SelectDuration({
    super.key,
    required this.duration,
    required this.title,
    required this.price,
    required this.isSelected,
    required this.onChanged,
    required this.description,
    this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    Gradient activeGradient = isSelected
        ? LinearGradient(
            colors: [Colors.purple.shade400, Colors.purple.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        : const LinearGradient(
            colors: [Colors.transparent, Colors.transparent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          );

    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: !isSelected
            ? AppColors.whiteColor.withOpacity(0.1)
            : AppColors.blackColor.withOpacity(0.37),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? const LinearGradient(
                          colors: [
                            AppColors.purpleColor,
                            AppColors.ligtPurple,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Checkbox(
                  value: isSelected,
                  onChanged: (value) => onChanged(value! ? duration : null),
                  activeColor: AppColors.transparentColor,
                  checkColor: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "$duration месяц",
                      style: body15MediumTextStyle,
                    ),
                  ),
                  Text(
                    description,
                    style: body12MediumTextStyle,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    price,
                    style: body16MediumTextStyle,
                  ),
                  Text(oldPrice ?? "",
                      style: body16MediumTextStyle.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.whiteColor.withOpacity(0.46),
                      )),
                ],
              ),
            ],
          ),
          isSelected
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 8,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "что описание",
                                style: body12MediumTextStyle,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                )
              : const Text(""),
        ],
      ),
    );
  }
}
