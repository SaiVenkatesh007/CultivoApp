import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/bottomnavbar.dart';

class BestCrop extends StatefulWidget {
  const BestCrop({super.key});

  @override
  State<BestCrop> createState() => _BestCropState();
}

class _BestCropState extends State<BestCrop> {
  @override
  Widget build(BuildContext context) {
    final pageWidth = MediaQuery.of(context).size.width;
    final pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff84aea4),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: pageHeight * 0.031,
                left: pageWidth * 0.178,
                right: pageWidth * 0.178,
              ),
              child: Text(
                "Best Crop Values",
                style: GoogleFonts.inter(
                  fontSize: 30,
                  color: const Color(0xff123A32),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: pageHeight * 0.017,
                left: pageWidth * 0.097,
                right: pageWidth * 0.097,
              ),
              child: Container(
                height: pageHeight * 0.78,
                width: pageWidth * 0.81,
                padding: EdgeInsets.only(
                    top: pageHeight * 0.04, left: pageWidth * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff65998D),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 2,
                      color: Colors.black.withOpacity(0.25),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Crop:",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: pageHeight * 0.011),
                      child: SizedBox(
                        height: pageHeight * 0.05125,
                        width: pageWidth * 0.7,
                        child: TextFormField(
                          style: GoogleFonts.inder(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xff84AEA4),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff84AEA4),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff84AEA4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: pageHeight * 0.03625,
                        left: pageWidth * 0.061,
                      ),
                      child: SizedBox(
                        height: pageHeight * 0.0575,
                        width: pageWidth * 0.580,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            backgroundColor: const Color(0xff133B33),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: pageWidth * 0.055,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: pageHeight * 0.08125),
                      width: pageWidth * 0.705,
                      height: pageHeight * 0.448,
                      padding: EdgeInsets.symmetric(
                        horizontal: pageWidth * 0.075,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffB9C6C3).withOpacity(0.55),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: pageHeight * 0.005,
                            ),
                            child: Center(
                              child: Text(
                                "Result",
                                style: GoogleFonts.inter(
                                  fontSize: 28,
                                  color: const Color(0xff123A32),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const ResultText(text: "Nitrogen:"),
                          const ResultText(text: "Phosphorous:"),
                          const ResultText(text: "Potassium:"),
                          const ResultText(text: "Temperature:"),
                          const ResultText(text: "Humidity:"),
                          const ResultText(text: "Rainfall:"),
                          const ResultText(text: "pH:"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}

class ResultText extends StatelessWidget {
  const ResultText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        top: pageHeight * 0.0062,
      ),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: GoogleFonts.inter(
          fontSize: 24,
          color: const Color(0xff123A32),
        ),
      ),
    );
  }
}
