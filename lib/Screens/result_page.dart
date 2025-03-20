import 'package:flutter/material.dart';
import 'package:khajo/Widgets/map.dart'; // Import your map widget
import 'package:khajo/Widgets/gradient.dart';
import 'question_page.dart'; // Import the question page

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class result_page extends StatefulWidget {
  const result_page({super.key});

  @override
  _result_pageState createState() => _result_pageState();
}

class _result_pageState extends State<result_page> {
  List<Map<String, String>> restaurants = []; // List to hold restaurant data

  @override
  void initState() {
    super.initState();
    loadRestaurants(); // Load restaurants from the mock data or API
  }

  // Simulating loading restaurants based on user's answers
  void loadRestaurants() {
    setState(() {
      restaurants = [
        {"name": "Luigi's Italian Bistro", "address": "123 Main St, San Francisco, CA"},
        {"name": "Golden Dragon Chinese", "address": "456 Elm St, San Francisco, CA"},
        {"name": "Taco Fiesta", "address": "789 Pine St, San Francisco, CA"},
        {"name": "Curry Corner", "address": "101 Maple St, San Francisco, CA"},
      ];
    });
  }

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
            // Restaurants List
            Positioned(
              top: 420,
              left: 35,
              right: 35,
              bottom: 90, // Leave space for the button
              child: _buildBoxWithStroke(
                child: ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = restaurants[index];
                    return GestureDetector(
                      onTap: () {
                        // Handle restaurant item click (e.g., open link or navigate to details page)
                        print("Clicked: ${restaurant["name"]}");
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restaurant["name"] ?? "",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'ADLaM',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                restaurant["address"] ?? "",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'ADLaM',
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        // Floating Action Button
        floatingActionButton: Positioned(
          bottom: 30, // Bottom-left placement
          left: 30,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const question_page(),
                ),
              );
            },
            child: Container(
              width: 120, // Button width
              height: 60, // Button height
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the button
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
                    Icons.arrow_back,
                    color: Colors.white,
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
}
