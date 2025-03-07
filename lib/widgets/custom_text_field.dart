import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: KprimaryColor,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: KprimaryColor),
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(KprimaryColor),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
