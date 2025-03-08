import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({required this.hint, this.maxLine = 1,this.onSaved, super.key});

  final String hint;
  final int maxLine;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if( value?.isEmpty ?? true){
          return 'Field is required';
        }else{
          return null;
        }
      },
      onSaved: onSaved,
      cursorColor: KprimaryColor,
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hint,
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
