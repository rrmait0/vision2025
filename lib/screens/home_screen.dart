import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vision/screens/signin_screen.dart';
import 'dart:convert';
import '../reusable_widgets/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLoggedIn(context),
      body: FutureBuilder(
            builder: (context,snapshot){
              var newData = json.decode(snapshot.data.toString());
              return ListView.separated(
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return listPattern( context, newData['Discipline'], index);
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemCount: newData['Discipline'] == null ? 0 : newData['Discipline'].length,
              );
            },
        future: DefaultAssetBundle.of(context).loadString('assets/jsonFiles/discipline.json'),
      ),
    );
  }
}
