import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final TextEditingController myController;
  final TextInputType textInputType;
  final IconData icons;
   CustomTextForm(
      {
      required this.hintText,
      required this.myController,
      required this.textInputType,
      required this.icons,
      super.key});
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      keyboardType: textInputType,
      validator: (val) {
        if (val!.length > 30) {
          return "$hintText 2  il ne peut pas dépasser 30 caractères";
        }
        if (val.length < 2) {
          return "$hintText 2 comporte plus de deux caractères";
        }
        return null;
      },
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          prefixIcon:  Icon(
            icons,
            color: Colors.blue,
          ),
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
