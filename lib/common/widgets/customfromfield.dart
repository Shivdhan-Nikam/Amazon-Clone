import 'package:flutter/material.dart';

class CustomFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  const CustomFormFiled(
      {super.key, required this.controller, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hinttext,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
      validator: (value) {},
    );
  }
}
