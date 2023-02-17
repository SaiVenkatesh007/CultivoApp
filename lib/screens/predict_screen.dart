import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/crop_input.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

@override
class _PredictionScreenState extends State<PredictionScreen> {
  TextEditingController _nController = TextEditingController();
  TextEditingController _pController = TextEditingController();
  TextEditingController _kController = TextEditingController();
  TextEditingController _tempController = TextEditingController();
  TextEditingController _phController = TextEditingController();
  TextEditingController _humController = TextEditingController();
  TextEditingController _rainController = TextEditingController();
  late List formData = [
    {'title': 'Nitrogen:', 'controller': _nController},
    {'title': 'Phosphorus:', 'controller': _pController},
    {'title': 'Potassium:', 'controller': _kController},
    {'title': 'Temperature:', 'controller': _tempController},
    {'title': 'pH:', 'controller': _phController},
    {'title': 'Humidity:', 'controller': _humController},
    {'title': 'Rainfall:', 'controller': _rainController}
  ];

  @override
  void dispose() {
    _nController.dispose();
    _pController.dispose();
    _kController.dispose();
    _tempController.dispose();
    _phController.dispose();
    _humController.dispose();
    _rainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageWidth = MediaQuery.of(context).size.width;
    final pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff84aea4),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: pageHeight * 0.031,
                left: pageWidth * 0.178,
                right: pageWidth * 0.178,
              ),
              child: Text(
                "Crop Prediction",
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
                    SizedBox(
                      height: pageHeight * 0.24,
                      width: pageWidth * 0.805,
                      child: GridView.builder(
                        itemCount: formData.length - 1,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: pageWidth *
                              0.311 /
                              (pageHeight * 0.025 + pageHeight * 0.038),
                        ),
                        itemBuilder: (context, index) {
                          return CropInput(
                            title: formData[index]['title'],
                            controller: formData[index]['controller'],
                          );
                        },
                      ),
                    ),
                    Center(
                        child: CropInput(
                      title: formData[formData.length - 1]["title"],
                      controller: formData[formData.length - 1]["controller"],
                    )),
                    Padding(
                      padding: EdgeInsets.only(
                        top: pageHeight * 0.044,
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
                      width: pageWidth * 0.705,
                      height: pageHeight * 0.265,
                      margin: EdgeInsets.only(top: pageHeight * 0.043),
                      padding: EdgeInsets.only(
                        top: pageHeight * 0.045,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffB9C6C3).withOpacity(0.55),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Result",
                            style: GoogleFonts.inter(
                              fontSize: 28,
                              color: const Color(0xff123A32),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: pageHeight * 0.02,
                            ),
                            child: Text(
                              "1. Crop1 - Percent",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.inter(fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: pageHeight * 0.0062,
                            ),
                            child: Text(
                              "2. Crop2 - Percent",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.inter(fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: pageHeight * 0.0062,
                            ),
                            child: Text(
                              "3. Crop3 - Percent",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.inter(fontSize: 24),
                            ),
                          )
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
    );
  }
}
