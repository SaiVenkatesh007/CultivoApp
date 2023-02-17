import 'package:flutter/material.dart';

import 'faqtile.dart';

final qnAns = [
  {
    "qn": "How to change between Manual and Sensor?",
    "ans":
        "Mobile Applications have only Manual input at the moment. You can visit the web interface for accessing the sensor based input information.",
  },
  {
    "qn": "Don’t know how to use?",
    "ans":
        "Please refer this video for the usage! https://tinyurl.com/CultivoApp "
  },
  {
    "qn": "Can I use this on my laptop or through my browser?",
    "ans":
        "Yes, you can use the same through our web client. You can access it in any browser.",
  }
];

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/FAQ_Page.png"),
            FAQTile(question: qnAns[0]['qn']!, ans: qnAns[0]['ans']!),
            FAQTile(question: qnAns[1]['qn']!, ans: qnAns[1]['ans']!),
            FAQTile(question: qnAns[2]['qn']!, ans: qnAns[2]['ans']!),
          ],
        ),
      ),
    );
  }
}
