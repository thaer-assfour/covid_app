import 'dart:io';
import 'package:covid_app/myColor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Alert.dart';

import '../settings.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: myColor1[4]),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(48.0),
              topRight: Radius.circular(48.0),
            ),
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  myColor1[2],
                  myColor1[1].withOpacity(0.7),
                ])),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 5),
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/user-profile-image.png'),
                    backgroundColor: Colors.white,
                    radius: 60,
                  ),
                ),
              ],
            ),
          ), // Profile Container
          Divider(
              thickness: 1,
              color: myColor1[0],
              endIndent: MediaQuery.of(context).size.width * 0.3),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: InkWell(
                    child: ListTile(
                      leading: Icon(
                        Icons.settings,
                        size: 24,
                        color: myColor1[0],
                      ),
                      title: Text("Settings",
                          style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: myColor1[0],
                              letterSpacing: 0.3)),
                      trailing: Icon(
                        LineIcons.arrow_circle_o_right,
                        size: 24,
                        color: myColor1[0],
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Settings();
                      }));
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: InkWell(
                    child: ListTile(
                      leading: Icon(
                        LineIcons.twitter,
                        size: 24,
                        color: myColor1[0],
                      ),
                      title: Text(
                        "Twitter",
                        style: GoogleFonts.lato(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: myColor1[0],
                            letterSpacing: 0.3),
                      ),
                      trailing: Icon(
                        LineIcons.arrow_circle_o_right,
                        size: 24,
                        color: myColor1[0],
                      ),
                    ),
                    onTap: () {
                      showAlertDialog(
                          context: context,
                          alertTitle: "Twitter News",
                          alertMessage:
                              "This is Pro Feature will be ASAP available.");
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: InkWell(
                    child: ListTile(
                      leading: Icon(
                        LineIcons.info_circle,
                        size: 24,
                        color: myColor1[0],
                      ),
                      title: Text(
                        "About",
                        style: GoogleFonts.lato(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: myColor1[0],
                            letterSpacing: 0.3),
                      ),
                      trailing: Icon(
                        LineIcons.arrow_circle_o_right,
                        size: 24,
                        color: myColor1[0],
                      ),
                    ),
                    onTap: () {
                      showAlertDialog(
                          context: context,
                          alertTitle: "COVID-19 Statistic",
                          alertMessage: "This is my first app.");
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: InkWell(
                    child: ListTile(
                      leading: Icon(
                        LineIcons.phone,
                        size: 24,
                        color: myColor1[0],
                      ),
                      title: Text(
                        "Call us",
                        style: GoogleFonts.lato(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: myColor1[0],
                            letterSpacing: 0.3),
                      ),
                      trailing: Icon(
                        LineIcons.arrow_circle_o_right,
                        size: 24,
                        color: myColor1[0],
                      ),
                    ),
                    onTap: () {
                      launch("tel://0993998520");
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: InkWell(
                    child: ListTile(
                      leading: Icon(
                        Icons.exit_to_app,
                        size: 24,
                        color: myColor1[0],
                      ),
                      title: Text("Exit",
                          style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: myColor1[0],
                              letterSpacing: 0.3)),
                    ),
                    onTap: () {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        exit(0);
                      });
                    },
                  ),
                )
              ],
            ),
          ), // Details Container
        ],
      )
    ]);
  }
}
