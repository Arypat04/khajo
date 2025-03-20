import 'package:flutter/material.dart';

class PressableButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const PressableButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _PressableButtonState createState() => _PressableButtonState();
}

class _PressableButtonState extends State<PressableButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (_) {
        setState(() {
          isPressed = true; // Set to pressed state
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false; // Return to unpressed state
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false; // Reset if tap is canceled
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        height: 84,
        width: 139,
        decoration: BoxDecoration(
          color: isPressed ? Colors.grey[300] : Colors.white, // Change color
          borderRadius: BorderRadius.circular(15),
          boxShadow: isPressed
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 5),
                  ),
                ],
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'ADLaM',
              color: isPressed ? Colors.black54 : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
