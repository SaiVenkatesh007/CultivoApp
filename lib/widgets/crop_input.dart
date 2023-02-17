import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CropInput extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  const CropInput({super.key, required this.title, this.controller});

  @override
  Widget build(BuildContext context) {
    final pageWidth = MediaQuery.of(context).size.width;
    final pageHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(fontSize: 15),
        ),
        Container(
          padding: EdgeInsets.only(top: pageHeight * 0.011),
          height: pageHeight * 0.036,
          width: pageWidth * 0.311,
          child: TextFormField(
            controller: controller,
            textInputAction: TextInputAction.next,
            style: GoogleFonts.inter(
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
        )
      ],
    );
  }
}
