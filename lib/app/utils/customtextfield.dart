import 'package:flutter/material.dart';
import 'package:v_track_it/app/utils/constants.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? icon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String label;
  const CustomTextField(
      {super.key,

      this.controller,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.icon,
      this.validator,
      this.onChanged,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,

          label: Text(label,
          style: TextStyle(fontSize: 18,
          color: kSecondaryTextColor),),
          prefixIcon: icon != null ? Icon(icon) : null,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kUnderLineEnabled),
          )),
    );
  }
}
