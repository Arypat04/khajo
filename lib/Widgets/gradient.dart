import 'package:flutter/material.dart';

class Gradients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color1 = Color(0xFFE98C29);
    final color2 = Color(0xFFD75151);
    final color3 = Color(0xFFDA9540);
    final color4 = Color(0xFFE94831);
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(begin:Alignment(-1,-1), end:Alignment(1,.6), colors: [color1, color2, color3, color4], stops: [0.0,0.37,0.72,1.0]),
      ),
    );
  }
}
