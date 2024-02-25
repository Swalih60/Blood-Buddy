import 'package:blood/components.dart';
import 'package:flutter/material.dart';

import 'admin_screen.dart';

class AdminCheckScreen extends StatelessWidget {
  AdminCheckScreen({super.key});
  final TextEditingController text = TextEditingController();
  final String pass = '@swalih@';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: textField(
          controller: text,
          label: 'Enter password',
          icon: Icons.lock,
          maxlength: 8),
      title: const Text("ADMIN"),
      actions: [
        TextButton(
          onPressed: () {
            if (text.text != pass) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Password Incorrect'),
                backgroundColor: Colors.red,
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Password matched'),
                backgroundColor: Colors.green,
              ));
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => AdminScreen(),
              ));
            }
          },
          child: const Text("Submit"),
        )
      ],
    );
  }
}
