// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blood/home_screen.dart';
import 'package:blood/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({
    super.key,
  });

  final FirebaseServices fs = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text("ADMIN"),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 161, 213, 250),
        body: StreamBuilder(
          stream: fs.readBlood(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List bloodlist = snapshot.data!.docs;
              return ListView.builder(
                itemCount: bloodlist.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = bloodlist[index];
                  String docID = doc.id;
                  Map<String, dynamic> data =
                      doc.data() as Map<String, dynamic>;
                  String blood = data['blood'];
                  String name = data['name'];
                  String num = data['num'];

                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.blue, Colors.purple],
                        ),
                      ),
                      child: ListTile(
                          leading: Text(
                            blood,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          title: Text(
                            name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: IconButton(
                              onPressed: () {
                                fs.deleteBlood(docID);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                          trailing: Text(
                            num,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text("Empty"));
            }
          },
        ));
  }
}
