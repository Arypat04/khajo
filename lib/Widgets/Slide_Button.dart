import 'package:flutter/material.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:khajo/Screens/question_page.dart';

// ignore: camel_case_types
class Slide_Button extends StatelessWidget {
  const Slide_Button({super.key});

  @override
  Widget build(BuildContext context) {
    String result = 'Button is on the top'; // Local variable to track the result
    Color buttonColor = Colors.white; // Default button color
    Color trackColor = Colors.transparent; // Default track color
    Color arrowColor = Colors.white; // Default arrow color

    return StatefulBuilder(
      builder: (context, setState) {
        return VerticalSlidableButton(
          initialPosition: SlidableButtonPosition.end,
          height: 800, // Adjust height
          width: 44,
          buttonHeight: 80.0, // Height of the sliding button
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          color: trackColor, // Track color
          buttonColor: buttonColor, // Button color set to white
          dismissible: false, // Prevents automatic dismiss on sliding
          label: Center(
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE98C29),
                  Color(0xFFD75151),
                  Color(0xFFDA9540),
                  Color(0xFFE94831),
                ],
              ).createShader(bounds),
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.white, // Arrow color is white to show the gradient
                size: 45,
              ),
            ),
          ), // Applying gradient to the arrow icon
          onChanged: (position) {
            // Update the result and colors dynamically based on the position
            setState(() {
              if (position == SlidableButtonPosition.start) {
                result = 'Button is on the top';

                // Trigger the fade animation to transition to the next page
                Navigator.of(context).push(_createFadeRoute());
              } else {
                result = 'Button is on the bottom';
                // Reset button color and arrow color to defaults when not at the top
                buttonColor = Colors.white;
                arrowColor = Colors.white;
              }
            });

            // For debugging or additional functionality
            debugPrint(result);
          },
        );
      },
    );
  }
}

Route _createFadeRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const question_page(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Create a fade-in and fade-out effect
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
