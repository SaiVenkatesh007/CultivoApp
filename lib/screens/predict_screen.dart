import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/input_data.dart';
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
  List formData = [
    "Nitrogen:",
    "Phosphorus:",
    "Potassium:",
    "Temperature:",
    "pH:",
    "Humidity:",
    "Rainfall:",
  ];
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
                    children: [
                      SizedBox(
                        height: pageHeight * 0.225,
                        width: pageWidth * 0.805,
                        child: GridView.builder(
                          itemCount: formData.length - 1,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: pageWidth *
                                0.311 /
                                (pageHeight * 0.023 + pageHeight * 0.036),
                          ),
                          itemBuilder: (context, index) {
                            return CropInput(
                              title: formData[index],
                            );
                          },
                        ),
                      ),
                      CropInput(title: formData[formData.length - 1]),
                      Padding(
                        padding: EdgeInsets.only(
                          top: pageHeight * 0.044,
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
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
