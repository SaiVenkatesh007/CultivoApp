import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'crop_input.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

@override
class _PredictionScreenState extends State<PredictionScreen> {
  final TextEditingController _nController = TextEditingController();
  final TextEditingController _pController = TextEditingController();
  final TextEditingController _kController = TextEditingController();
  final TextEditingController _tempController = TextEditingController();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _humController = TextEditingController();
  final TextEditingController _rainController = TextEditingController();
  late List formData = [
    {'title': 'Nitrogen:', 'controller': _nController},
    {'title': 'Phosphorus:', 'controller': _pController},
    {'title': 'Potassium:', 'controller': _kController},
    {'title': 'Temperature:', 'controller': _tempController},
    {'title': 'pH:', 'controller': _phController},
    {'title': 'Humidity:', 'controller': _humController},
    {'title': 'Rainfall:', 'controller': _rainController}
  ];
  var passData = [];

  bool _isLoading = false;
  String pred = "Please give values!";
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

  void _clearData() {
    _nController.clear();
    _pController.clear();
    _kController.clear();
    _tempController.clear();
    _phController.clear();
    _humController.clear();
    _rainController.clear();
  }

  Future<String> _getResult(List data) async {
    final res = await http.post(
      Uri.parse('http://192.168.1.14:8000/manual.html/pred'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, List>{
        'params': data,
      }),
    );
    if (res.statusCode == 200) {
      setState(() {
        pred = jsonDecode(res.body)["result"].toString().toUpperCase();
        _isLoading = false;
      });
      return jsonDecode(res.body)["result"];
    } else {
      return "Error Fetching Data";
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageWidth = MediaQuery.of(context).size.width;
    final pageHeight = MediaQuery.of(context).size.height;

    var passData = [];
    void getData() {
      var N = double.parse(_nController.text);
      var P = double.parse(_pController.text);
      var K = double.parse(_kController.text);
      var pH = double.parse(_phController.text);
      var temp = double.parse(_tempController.text);
      var hum = double.parse(_humController.text);
      var rain = double.parse(_rainController.text);
      passData.add(N);
      passData.add(P);
      passData.add(K);
      passData.add(temp);
      passData.add(hum);
      passData.add(pH);
      passData.add(rain);
    }

    return _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xff123A32),
              ),
            )
          : SafeArea(
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
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
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
                            controller: formData[formData.length - 1]
                                ["controller"],
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
                                onPressed: () {
                                  setState(() {
                                    _isLoading = true;
                                    getData();
                                    _getResult(passData);
                                    _clearData();
                                  });
                                },
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
                            // padding: EdgeInsets.only(
                            //   top: pageHeight * 0.064,
                            // ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xffB9C6C3).withOpacity(0.55),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                    top: pageHeight * 0.01,
                                  ),
                                  child: Text(
                                    pred,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.inter(fontSize: 24),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
  }
}
