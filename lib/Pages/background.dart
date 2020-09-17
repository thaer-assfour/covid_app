import 'package:covid_app/myColor.dart';
import 'package:flutter/material.dart';

Widget backGround (ctx){

  return  Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              myColor1[3].withOpacity(0.1), // starting color for background widget
              myColor1[3].withOpacity(0.15),// middle color for background widget
              myColor1[0].withOpacity(0.1),// middle color for background widget
              myColor1[0].withOpacity(0.2),// End color for background widget
            ])),
  );
}