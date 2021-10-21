// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';


InputDecoration InputDecorationSignin(String hintext){
  return InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    hintText: hintext,
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
  );
}



TextStyle TextStyleColor(){
  return TextStyle(
    color: Colors.white,
    fontSize: 16,
  );
}