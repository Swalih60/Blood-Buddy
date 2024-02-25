import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  final CollectionReference services =
      FirebaseFirestore.instance.collection("bloods");

  Future<void> addBlood(String name, String num, String blood) {
    return services.add({
      'name': name,
      'num': num,
      'blood': blood,
      'time': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> readBlood() {
    final snaps = services.snapshots();
    return snaps;
  }

  Future<void> deleteBlood(String docId) {
    return services.doc(docId).delete();
  }
}
