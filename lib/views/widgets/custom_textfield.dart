import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.labelText,
      this.keyboardType = "text",
      this.onChanged});
  final String labelText;
  final String keyboardType;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:
          keyboardType == "number" ? TextInputType.number : TextInputType.text,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        labelText: labelText,
      ),
    );
  }
}
