import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget text(String string,double size,
    {var color = Colors.black,FontWeight fontWeight=FontWeight.normal,}){
  return Text(string,
  style:TextStyle(
    fontWeight:fontWeight,
    color: color,
    fontSize: size,
  ),);
}