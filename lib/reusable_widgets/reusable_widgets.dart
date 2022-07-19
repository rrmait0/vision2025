import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vision/screens/discipline_home_screen.dart';
import 'dart:convert';
import '../utils/colors_utils.dart';

import 'package:vision/screens/signin_screen.dart';
import 'package:vision/screens/quiz_screen.dart';


AppBar appBarSignUp(){
  return AppBar(
    title: Row(
     // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/logo.png', fit: BoxFit.cover, height: 60.0,),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'Vision 2025',
            style: TextStyle(
              fontFamily: 'Righteous',
              fontSize: 20.0
            ),
          ),
        )
      ],
    ),
  );
}

AppBar appBarLoggedIn(context){
  return AppBar(
    title: Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/logo.png', fit: BoxFit.cover, height: 60.0,),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'Vision 2025   ',
            style: TextStyle(
                fontFamily: 'Righteous',
                fontSize: 20.0
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
            });
          },
          child: const Text(
            "Log Out",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}


Image logoWidget(String imageName){
  return Image.asset(
  imageName,
  fit: BoxFit.fitWidth,
  width:240,
  height: 240,
  //color: Colors.white,
  );
}



TextField reusableTextField(String text, IconData icon, bool isPasswordType, TextEditingController controller){
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width:0, style: BorderStyle.none)
      ),
    ),
    keyboardType: isPasswordType ? TextInputType.visiblePassword: TextInputType.emailAddress,
  );
}

Container signInSignUpButton(BuildContext context, bool isLogin, Function onTap){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states){
          if(states.contains(MaterialState.pressed)){
            return Colors.black26;
          }
          return Colors.white;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        isLogin ? 'Login' : 'SIGN UP',
        style: const TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold, fontSize:16),
      ),
    ),
  );
}


Container listPattern(context, entries, index){
  return Container(
    color: index % 2 == 0 ? Colors.green : Colors.greenAccent,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('images/icons/${entries[index]['image']}', fit: BoxFit.cover, height: 40.0,),
        GestureDetector(
          onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DisciplineHomeScreen(
                    indexValue:index,
                    //indexValue:(index).toString(),
                  )));
          },
          child: Text(
            entries[index]['name'],
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => QuizScreen()));
          },
          child: const Text('Play Quiz'),
        ),
      ],
    ),
  );
}


Container questionDisplay(context,  entries, index){
  double c_width = MediaQuery.of(context).size.width*0.8;
  return Container (
    padding: const EdgeInsets.all(16.0),
    width: c_width,
    child: Column (
      children: <Widget>[
          Text (entries[index]['question'], textAlign: TextAlign.left),
        radioBtn(context),
        ],
    ),
  );
}

Column radioBtn(context){
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(children:[
          Radio(
            value:1,
            groupValue: 1,
            onChanged: (value){},
          ),
          const SizedBox(width: 10.0,),
          const Text("Yes"),
        ],),
        Row(children:[
          Radio(
            value:1,
            groupValue: 2,
            onChanged: (value){},
          ),
          const SizedBox(width: 10.0,),
          const Text("No"),
        ],)
      ],
  );
}