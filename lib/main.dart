import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vision/screens/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'Vision 2025',
      home: SignInScreen()
    );
  }
}

