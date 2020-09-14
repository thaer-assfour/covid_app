import 'package:covid_app/myColor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget details({context, String name, String val, String link}) {
  return Container(

    height: MediaQuery.of(context).orientation ==
      Orientation.portrait
      ? MediaQuery.of(context).size.height / 15
      : MediaQuery.of(context).size.height / 10,
    alignment: Alignment(0, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(

          width: MediaQuery.of(context).size.width / 3,
          child: Text(
            " $name: ",
              style: GoogleFonts.lato(
                  color: myColor1[0],
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child: Text(
            "$val",
              style: GoogleFonts.lato(
                  color: myColor1[0],
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8)
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundImage: AssetImage(link),
            backgroundColor: myColor1[2],
            radius: 24,
          ),
        ),
      ],
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(32),
      color: myColor1[2],
      boxShadow: [
        BoxShadow(color: myColor1[0].withOpacity(0.5), spreadRadius: 3),
      ],
    ),

  );
}
