import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:natraj_packaging/authentication/auth.dart';
import 'package:natraj_packaging/screens/homescreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:natraj_packaging/screens/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //AuthMethods authmethods = new AuthMethods();
  final formKey = GlobalKey<FormState>();
  TextEditingController loginemail = new TextEditingController();
  TextEditingController loginpassword = new TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? errorMessage;

  // ignore: non_constant_identifier_names
  /*LogIn() {
    if (formkey.currentState!.validate()) {
      authmethods.SignInwithEmailandPassword(
              loginemail.text, loginpassword.text)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(
          "Natraj Packaging",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backwardsCompatibility: false,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.red,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
                height: 550,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.red, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        child: TextFormField(
                                          validator: (val) {
                                            return RegExp(
                                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                    .hasMatch(val!)
                                                ? null
                                                : "Enter Valid Email ";
                                          },
                                          controller: loginemail,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Email Id",
                                              hintStyle: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.red)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 250,
                                      child: Text(
                                        "Forgot Password?",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.red, width: 2),
                                      borderRadius:
                                          BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextFormField(
                                      obscureText: true,
                                      validator: (val) {
                                        return RegExp(
                                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                                .hasMatch(val!)
                                            ? null
                                            : "Enter a valid password";
                                      },
                                      controller: loginpassword,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                            fontSize: 17,
                                            color: Colors.red,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            signIn(loginemail.text, loginpassword.text);
                          },
                          child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                  child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Image.asset(
                                  'assests/google.jpg',
                                  height: 43,
                                ),
                              ),
                              Text(
                                "Log In with Google",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Text(
              "Dont Have an Account?",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

    void signIn(String email, String password) async {
    if (formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
