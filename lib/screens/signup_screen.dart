import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../reusable_widgets/reusable_widgets.dart';
import '../utils/colors_utils.dart';
import 'package:vision/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Sign Up", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("CB2b93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                      height: 30
                  ),
                  reusableTextField("Enter Name", Icons.person_outline, false, _nameTextController),
                  const SizedBox(
                      height: 30
                  ),
                  reusableTextField("Enter Email", Icons.person_outline, false, _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  signInSignUpButton(context, false, () {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email:_emailTextController.text,
                        password:_passwordTextController.text)
                        .then((value) {
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                  });
                  })
                ],
              ),
            )
        ),
      ),
    );
  }
}
