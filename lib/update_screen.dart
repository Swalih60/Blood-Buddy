import 'package:blood/components.dart';
import 'package:blood/model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  FirebaseServices fs = FirebaseServices();
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  String selectedItem = 'A+';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 186, 222, 247),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              textField(
                icon: Icons.person,
                label: 'Enter your name',
                maxlength: 30,
                controller: text1,
              ),
              textField(
                controller: text2,
                icon: Icons.phone,
                label: 'Enter your phone number',
                maxlength: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: DropdownButton<String>(
                      value: selectedItem,
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'A+',
                          child: Text("A+"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'A-',
                          child: Text("A-"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'B+',
                          child: Text("B+"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'B-',
                          child: Text("B-"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'O+',
                          child: Text("O+"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'O-',
                          child: Text("O-"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'AB+',
                          child: Text("AB+"),
                        ),
                        DropdownMenuItem<String>(
                          value: 'AB-',
                          child: Text("AB-"),
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedItem = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: SizedBox(
                  height: 50,
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      if (text1.text.isEmpty ||
                          text2.text.isEmpty ||
                          text2.text.length < 10) {
                        snack1(context);
                      } else {
                        snack2(context);
                        fs.addBlood(
                          text1.text,
                          text2.text,
                          selectedItem,
                        );
                        text1.clear();
                        text2.clear();
                      }
                    },
                    child: const Text(
                      "Update",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

snack1(context) {
  return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    backgroundColor: Colors.red,
    content: Text("Error"),
  ));
}

snack2(context) {
  return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    backgroundColor: Colors.green,
    content: Text("Updated Successfully"),
  ));
}
