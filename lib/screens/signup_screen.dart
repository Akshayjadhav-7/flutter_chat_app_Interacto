// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../screens/signin_screen.dart';
import '../widgets/widget.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interacto'),
        // leading: Icon(Icons.keyboard_arrow_left_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecorationSignin('Username'),

                ),SizedBox(height: 5,),

                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecorationSignin('Email'),

                ),SizedBox(height: 5,),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecorationSignin('Password'),
                ),
                SizedBox(height: 15,),
                // Container(
                //   alignment: Alignment.centerRight,
                //   child:InkWell(
                //       onTap: (){},
                //       child: Text('Forgot Password?',style:TextStyleColor())),
                // ),
                SizedBox(height: 15,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(colors: [
                        Color(0xFF4169e1),
                        Color(0xFF1e90ff),
                      ]),
                    ),
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Text('SignUp',style: TextStyleColor(),),
                  ),
                ), SizedBox(height: 15,),
                InkWell(
                  onTap: (){},
                  child: Container(

                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Text('Sign Up with Google',style: TextStyle(color: Colors.black)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,

                    ),

                  ),
                ),SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an Account?',style: TextStyleColor(),),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                      },
                      child: Text('SignIn',style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 17
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}