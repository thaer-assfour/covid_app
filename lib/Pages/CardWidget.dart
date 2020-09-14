import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../myColor.dart';

Widget cardWidget(context, String name, String val) {
  return ShowUpAnimation(
    delayStart: Duration(seconds: 0),
    animationDuration: Duration(seconds: 1),
    curve: Curves.ease,
    direction: Direction.horizontal,
    offset: 0.5,
    child: Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 2.2,
      child: Card(
        shadowColor: myColor1[1],
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          side: new BorderSide(color: myColor1[4], width: 1.0),
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: myColor1[2].withOpacity(0.7),
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "$name",
              style: GoogleFonts.lato(
                  color: myColor1[0],
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "$val",
              style: GoogleFonts.lato(
                  color: myColor1[3],
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    ),
  );
}
