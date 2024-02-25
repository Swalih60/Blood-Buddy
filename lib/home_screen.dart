import 'package:blood/list_screen.dart';
import 'package:blood/update_screen.dart';
import 'package:flutter/material.dart';

String selectedItem = 'A+';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages = [
    ListScreen(),
    const UpdateScreen(),
  ];

  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              alignment: Alignment.center,
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 250, 169, 164),
              ),
              child: DropdownButton<String>(
                icon: const Icon(Icons.arrow_drop_down),
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
          ),
        ],
        backgroundColor: Colors.red,
        title: const Text("Blood Bank"),
        centerTitle: true,
      ),
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        backgroundColor: Color.fromARGB(255, 181, 220, 251),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: "UPDATE",
          ),
        ],
        currentIndex: selectedPage,
        onTap: (value) {
          setState(() {
            selectedPage = value;
          });
        },
      ),
    );
  }
}
