import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zomet/utils/utils.dart';

class AuthMethods {
  final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> signInWithGoogle(BuildContext context) async {
    bool isNewuser = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        showSnakbar(context, 'Google Sign In Failed');
        return false;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      UserCredential userCredential =
          await _firebaseauth.signInWithCredential(credential);

      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL
          });
          isNewuser = true;
        }
      }
    } on FirebaseAuthException catch (err) {
      showSnakbar(context, err.message!);
      isNewuser = false;
    } on Exception catch (e) {
      print(e.toString());
      showSnakbar(context, e.toString());
      isNewuser = false;
    }
    return isNewuser;
  }
}
