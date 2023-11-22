import 'package:bisfind/models/userdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerUser({
    required String email,
    required String password,
    required String name,
  }) async {
    String resp = 'Some error occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty || name.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        UserData userData =
            UserData(email: email, uid: cred.user!.uid, name: name);

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(userData.toJson());
      }
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}
