import 'package:flutter/material.dart';
import 'package:khajo/Widgets/Slide_Button.dart';
import 'package:khajo/Widgets/gradient.dart';

final Color darkBlue = const Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // Background Gradient
            Positioned.fill(
              child: Gradients(),
            ),
            // Foreground Content
            Column(
              children: [
                // Add spacing above the text
                const SizedBox(height: 130), // Adjust the height to control the downward shift
                // Title Text
                const Center(
                  child: Text(
                    'Khajo',
                    style: TextStyle(
                      fontFamily: 'ADLaM',
                      fontSize: 70,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Add spacing between the title and the image
                // Image with fixed size
                Center(
                  child: Image.asset(
                    'images/Samosa.png',
                    height: 200, // Fixed height
                    width: 200,  // Fixed width
                    fit: BoxFit.contain, // Ensures proportional scaling
                  ),
                ),
                // Add spacing between the image and the subtitle
                const SizedBox(height: 20),
                // Subtitle Text
                const Center(
                  child: Text(
                    'When Hunger Meets Perfect Suggestions',
                    style: TextStyle(
                      fontFamily: 'ADLaM',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Spacer to push the button to the bottom
                const Spacer(),
              ],
            ),
            // Place the slide button behind other components and at the bottom
            const Positioned(
              bottom: 55.0, // Space from the bottom of the screen
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 180.0), // Adjust as needed
                child: Slide_Button(),
              ),
            ),
            const Positioned(
                  bottom: 30.0, // Space from the bottom of the screen
                  left: 0,
                  right: 0,
                  child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 160.0),
                  child: Text(
                    'Swipe Up!',
                    style: TextStyle(
                      fontFamily: 'ADLaM',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
