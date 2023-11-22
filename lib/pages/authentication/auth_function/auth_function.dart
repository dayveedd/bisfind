import 'package:firebase_auth/firebase_auth.dart';

Future<void> createAccount(String email, String password) async {
  try {
    final auth = FirebaseAuth.instance;
    auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print('Error creating account: $e');
    // Handle the error appropriately (show a message to the user, log, etc.)
  }
}

Future<void> loginUser(String email, String password) async {
  try {
    final auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print('Error signing in: $e');
    // Handle the error appropriately (show a message to the user, log, etc.)
  }
}
