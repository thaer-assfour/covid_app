import 'package:flutter/material.dart';
import '../myColor.dart';
import '../settings.dart';

Widget myAppBar ( { ctx , bool settingValue , String title} ){

  return  AppBar(
    backgroundColor: myColor1[0],
    actions: [
      InkWell(
        onTap: () {
          Navigator.push(ctx, MaterialPageRoute(builder: (ctx) {
            return Settings();
          }));
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            Icons.settings,
            size: 30.0,
          ),
        ),
      )
    ],
    elevation: 4,
    title: Text(
      "{$title}",
      style: TextStyle(
          letterSpacing: 1,
          fontFamily: "SourceSansPro",
          fontWeight: FontWeight.bold,
          color: myColor1[2]),
    ),
    centerTitle: true,
    iconTheme: new IconThemeData(color: myColor1[2]),
  );

}