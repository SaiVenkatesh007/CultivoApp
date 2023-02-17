import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'feature_screen.dart';

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
                  horizontal: pageWidth * 0.0972,
                  vertical: pageHeight * 0.05,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color(0xffD9D9D9).withOpacity(0.81),
                  ),
                  height: pageHeight * 0.2975,
                  width: pageWidth * 0.805,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: pageWidth * 0.078,
                      vertical: pageHeight * 0.02,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Cultivo is an AI-driven solution for problems faced by farmers. It is a platform to make their work easier and more efficient",
                          textAlign: TextAlign.center,
                          maxLines: 6,
                          style: TextStyle(
                            fontSize: pageWidth * 0.056,
                            color: const Color(0xff133B33),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: pageHeight * 0.015),
                          child: SizedBox(
                            height: pageHeight * 0.0575,
                            width: pageWidth * 0.583,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                backgroundColor: const Color(0xff133B33),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const FeatureScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Get Started",
                                style: GoogleFonts.inter(
                                  fontSize: pageWidth * 0.055,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
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
