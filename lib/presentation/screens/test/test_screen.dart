import 'package:flutter/material.dart';
import 'package:test_project/constants/app_colors.dart';

import '../../../constants/app_text_style.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/select_duration_widgets.dart';
import '../../widgets/semi_circular_gradient_painter.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int? selectedDuration = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Stack(
          children: [
            CustomPaint(
              size: MediaQuery
                  .of(context)
                  .size,
              painter: SemiCircularGradientPainter(topLeft: true),
            ),
            CustomPaint(
              size: MediaQuery
                  .of(context)
                  .size,
              painter: SemiCircularGradientPainter(topLeft: false),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "Выберите подписку",
                          style: body20MediumTextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: SelectDuration(
                            duration: 1,
                            title: "1 месяц",
                            price: "1000 р",
                            isSelected: selectedDuration == 1,
                            onChanged: (value) {
                              setState(() {
                                selectedDuration = value;
                              });
                            },
                            description: 'Описание',
                          ),
                        ),
                        SelectDuration(
                          duration: 6,
                          title: "6 месяц",
                          price: "10000р",
                          isSelected: selectedDuration == 6,
                          onChanged: (value) {
                            setState(() {
                              selectedDuration = value;
                            });
                          },
                          description: 'Описание',
                          oldPrice: "12000",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 16.0),
                          child: GradientElevatedButton(
                            onPressed: () {},
                            text: "Купить",

                          ),
                        ),
                      ],),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "terms of use",
                              style: body12MediumTextStyle.copyWith(
                                  color: AppColors.whiteColor
                                      .withOpacity(0.3)),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "policy privacy",
                              style: body12MediumTextStyle.copyWith(
                                  color: AppColors.whiteColor
                                      .withOpacity(0.3)),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                              AppColors.purpleColor.withOpacity(0.1),
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text("Restore purchase"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
