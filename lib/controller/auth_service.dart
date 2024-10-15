import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthService {
  static Future<String> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      String uid = userCredential.user!.uid;
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      DatabaseReference ref = FirebaseDatabase.instance.ref("UsersData/$uid");
      await ref.set({
        "isLoggedIn": true,
        "fcmToken": fcmToken
      });
      return 'Success Login';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  static Future logout() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DatabaseReference ref = FirebaseDatabase.instance.ref("UsersData/$uid");
    await ref.update({
      "fcmToken": "-",
      "isLoggedIn": false,
    });
    await FirebaseMessaging.instance.deleteToken();
    await FirebaseAuth.instance.signOut();
  }
}