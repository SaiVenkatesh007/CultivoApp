import 'dart:ui';

import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height;
    final pageWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset("assets/Splash.jpg"),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: pageWidth * 0.03, vertical: pageHeight * 0.02),
                child: Container(
                  color: Colors.transparent.withOpacity(0.5),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: pageWidth * 0.06,
                        vertical: pageHeight * 0.003),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Cultivo us an AI-driven solution for problems faced by farmers. It is a platform to make their work easier and more efficient",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Get Started"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
