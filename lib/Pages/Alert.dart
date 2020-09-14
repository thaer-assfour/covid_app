import 'package:covid_app/myColor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

showAlertDialog(
    {BuildContext context, String alertTitle, String alertMessage}) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK",
        style: GoogleFonts.lato(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: myColor1[0])),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$alertTitle",
            style: GoogleFonts.lato(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: myColor1[0])),
        Icon(LineIcons.exclamation_triangle),
      ],
    ),
    content: Text(
      "$alertMessage",
      style: GoogleFonts.lato(
          color: myColor1[0], fontSize: 16, fontWeight: FontWeight.w300),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
