import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/user.dart';

class AuthService{
  final FirebaseAuth _auth= FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user!=null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }
  // sign in anon
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  // sign in with email & password

  // register with email/password

  //sign-out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}