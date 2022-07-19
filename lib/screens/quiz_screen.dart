import 'package:flutter/material.dart';
import 'dart:convert';
import '../reusable_widgets/reusable_widgets.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
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
              return questionDisplay( context, newData['Discipline'][0]['questions'], index);
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemCount: newData['Discipline'] == null ? 0 : newData['Discipline'][0]['questions'].length,
          );
        },
        future: DefaultAssetBundle.of(context).loadString('assets/jsonFiles/discipline.json'),
      ),
    );
  }
}
