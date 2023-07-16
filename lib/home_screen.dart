import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/my_button.dart';
import 'package:untitled/second_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';



class  HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text("Login Page"),
      centerTitle: true,
    ),
        body : Form(
      key: _formKey,
      child:  Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField( controller: emailControler,decoration: new InputDecoration(
                hintText: 'Email'
            ),
              validator: (value){
              if(value!.isEmpty){
                return  "Please enter your email";
              }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField( decoration: new InputDecoration(
                hintText: 'Password'
            ),
              validator: (value){
                if(value!.length < 7){
                  return  "Please enter a password that contains more than 7 chars";
                }
              },

            ),
          ),

          InkWell(
            onTap:(){
              if(_formKey.currentState!.validate()){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>
                SecondScreen(
                  email: emailControler.text,


                )
                ));
              }
            },
            child: MyButton(label: "Login"),),








        ],
      ),
    )

    );
  }
}
