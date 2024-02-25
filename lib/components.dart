// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: camel_case_types
class textField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final int maxlength;

  const textField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    required this.maxlength,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        maxLength: maxlength,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.blue),
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.green),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
