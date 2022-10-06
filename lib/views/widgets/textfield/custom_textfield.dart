import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.textInputType,
      this.isObscureText = false,
      this.isAutoCorrect = false,
      this.isEnableSuggestion = false,
      this.fillColor = const Color(0xFFD9D9D9),
      this.style,
      this.borderColor = const Color(0xFFD9D9D9),
      this.suffixIcon});
  final String hintText;
  final TextInputType? textInputType;
  final bool isObscureText;
  final bool isAutoCorrect;
  final bool isEnableSuggestion;
  final Color fillColor;
  final TextStyle? style;
  final Color borderColor;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      obscureText: isObscureText,
      enableSuggestions: isEnableSuggestion,
      autocorrect: isAutoCorrect,
      keyboardType: textInputType,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: style,
          suffixIcon: suffixIcon,
          fillColor: fillColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: borderColor, width: 2.0))),
    );
  }
}