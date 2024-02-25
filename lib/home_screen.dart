import 'package:blood/list_screen.dart';
import 'package:blood/search_screen.dart';
import 'package:blood/update_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  ValueNotifier dropValue = ValueNotifier('A+');

  final List<Widget> pages = [
    ListScreen(),
    const UpdateScreen(),
  ];

  ValueNotifier selectedPage = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          "Choose a blood group",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        content: Container(
                          alignment: Alignment.center,
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 250, 169, 164),
                          ),
                          child: ValueListenableBuilder(
                            valueListenable: dropValue,
                            builder: (context, value, child) {
                              return DropdownButton<String>(
                                icon: const Icon(Icons.arrow_drop_down),
                                value: dropValue.value,
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
                                onChanged: (String? newvalue) {
                                  dropValue.value = newvalue;
                                },
                              );
                            },
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => SearchScreen(
                                              selectedItem: dropValue.value,
                                            )));
                              },
                              child: const Text("Submit"))
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.search)),
          ),
        ],
        backgroundColor: Colors.red,
        title: const Text("Blood Bank"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPage,
        builder: (context, value, child) {
          return pages[selectedPage.value];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.green,
        backgroundColor: const Color.fromARGB(255, 181, 220, 251),
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
        currentIndex: selectedPage.value,
        onTap: (value) {
          selectedPage.value = value;
        },
      ),
    );
  }
}
