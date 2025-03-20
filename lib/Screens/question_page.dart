import 'dart:convert'; // For JSON parsing
import 'package:flutter/material.dart';
import 'package:khajo/Widgets/map.dart'; // Import your map widget
import 'package:khajo/Widgets/gradient.dart';
import 'result_page.dart'; // Import the result page

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class question_page extends StatefulWidget {
  const question_page({super.key});

  @override
  _question_pageState createState() => _question_pageState();
}

class _question_pageState extends State<question_page> {
  List<Map<String, dynamic>> questions = []; // To store the questions
  int currentQuestionIndex = 0; // Track the current question index

  @override
  void initState() {
    super.initState();
    loadQuestions(); // Load the questions from the JSON file
  }

  void loadQuestions() {
    const jsonString = '''
    [
      {
        "question": "What cuisine do you prefer?",
        "options": ["Italian", "Chinese", "Mexican", "Indian"]
      },
      {
        "question": "Do you prefer dine-in or delivery?",
        "options": ["Dine-in", "Delivery", "No preference", "Other"]
      }
    ]
    ''';

    setState(() {
      questions = List<Map<String, dynamic>>.from(json.decode(jsonString));
    });
  }

  void nextQuestion(String selectedOption) {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // Logic for end of questions
      print("End of questions. Selected option: $selectedOption");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Center(child: CircularProgressIndicator()); // Loading state
    }

    final currentQuestion = questions[currentQuestionIndex];
    final questionText = currentQuestion["question"];
    final options = List<String>.from(currentQuestion["options"]);

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
            // Map Box (Top Half)
            Positioned(
              top: 60,
              left: 35,
              right: 35,
              child: _buildBoxWithStroke(
                child: const SizedBox(
                  height: 331,
                  width: 331,
                  child: CustomMap(lat: 37.7749, lon: -122.4194), // Map widget
                ),
              ),
            ),
            // Question Box
            Positioned(
              top: 440,
              left: 35,
              right: 35,
              child: _buildBoxWithStroke(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  height: 84,
                  child: Text(
                    questionText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'ADLaM',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            // Option Buttons
            Positioned(
              bottom: 235,
              left: 35,
              child: _buildBoxWithStroke(
                child: _buildOptionButton(options[0]),
              ),
            ),
            Positioned(
              bottom: 235,
              right: 35,
              child: _buildBoxWithStroke(
                child: _buildOptionButton(options[1]),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 35,
              child: _buildBoxWithStroke(
                child: _buildOptionButton(options[2]),
              ),
            ),
            Positioned(
              bottom: 100,
              right: 35,
              child: _buildBoxWithStroke(
                child: _buildOptionButton(options[3]),
              ),
            ),
            // Samosa Image
            Positioned(
              bottom: 195,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'images/Samosa.png',
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ],
        ),
        // Add Floating Action Button
            // Floating Button with Gradient Arrow Icon
            floatingActionButton: Positioned(
              bottom: 30, // Position the button near the bottom
              right: 30, // Position it near the right edge
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const result_page(),
                    ),
                  );
                },
                child: Container(
                  width: 120, // Width of the button
                  height: 60, // Height of the button
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color of the rectangle
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
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
                        Icons.arrow_forward,
                        color: Colors.white, // Make the icon visible with gradient
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ),
            ),

      ),
    );
  }

  // Helper method to create a box with a gradient outline
  Widget _buildBoxWithStroke({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-1, -1),
          end: Alignment(1, 0.6),
          colors: [
            Color(0xFFE98C29),
            Color(0xFFD75151),
            Color(0xFFDA9540),
            Color(0xFFE94831),
          ],
          stops: [0.0, 0.37, 0.72, 1.0],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF2D2626),
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
  }

  // Helper method to create clickable option buttons
  Widget _buildOptionButton(String text) {
    return GestureDetector(
      onTap: () => nextQuestion(text),
      child: Container(
        height: 84,
        width: 139,
        decoration: BoxDecoration(
          color: Colors.white, // Option background color
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'ADLaM',
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
