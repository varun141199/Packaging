import 'package:firebase_auth/firebase_auth.dart';
import 'package:natraj_packaging/model/user.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? _userFromFirebaseUser(User user){
    // ignore: unnecessary_null_comparison
    return user != null ? UserModel(uid: user.uid) : null ;
  }

  // ignore: non_constant_identifier_names
  Future SignInwithEmailandPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }catch(e){
      print(e.toString());
    }
  }

  // ignore: non_constant_identifier_names
  Future SignUpwithEmailandPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }catch(e){
      print(e.toString());
    }
  }

  Future resetpassword(String email) async{
    try{
      return await _auth.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}