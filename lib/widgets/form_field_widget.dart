import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final TextStyle labelStyle;
  final TextStyle hintStyle;
  final TextStyle textStyle;
  final InputDecoration decoration;

  const FormFieldWidget({
    Key? key,
    required this.label,
    required this.hint,
    required this.labelStyle,
    required this.hintStyle,
    required this.textStyle,
    required this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle,
      decoration: decoration.copyWith(
        labelText: label,
        hintText: hint,
        labelStyle: labelStyle,
        hintStyle: hintStyle,
      ),
    );
  }
}
