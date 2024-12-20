import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.validator,
    required this.obscureText,
    required this.textInputType,
    this.onSaved,
  });

  final String hintText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
        obscureText: obscureText,
        onSaved: onSaved,
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFDFDCDC)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFDFDCDC)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFDFDCDC)),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFDFDCDC)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0XFFDFDCDC)),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
