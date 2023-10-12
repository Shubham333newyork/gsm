import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double maxWidth = constraints.maxWidth;
            double maxHeight = constraints.maxHeight;
            

            // Adjust these values as needed for your design
            double targetWidth = maxWidth * 1.5;
            double targetHeight = maxHeight * 2.5;

            return Image.asset(
              'lib/assets/info.jpeg',
              width: targetWidth,
              height: targetHeight,
              fit: BoxFit.fill,
              
              
            );
          },
        ),
      ),
    );
  }
}