// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blood/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ListScreen extends StatelessWidget {
  ListScreen({
    super.key,
  });

  final FirebaseServices fs = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          subtitle: IconButton(
                              onPressed: () {
                                FlutterPhoneDirectCaller.callNumber(num);
                              },
                              icon: const Icon(
                                Icons.call,
                                color: Colors.green,
                              )),
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
