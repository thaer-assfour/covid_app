import 'package:covid_app/Pages/ChartWidget.dart';
import 'package:covid_app/Pages/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'covid.dart';
import 'package:avatar_glow/avatar_glow.dart';
import './Pages/DetailsWidget.dart';
import 'package:time_formatter/time_formatter.dart';

import 'myColor.dart';

class CountryDetails extends StatefulWidget {
  final Covid cov;
  CountryDetails({this.cov});


  @override
  _CountryDetailsState createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: myColor1[0],
          title: Text(
            "Details For ${widget.cov.country}", // country name from passed param
            style: GoogleFonts.lato(
              fontStyle: FontStyle.normal,
              color: myColor1[2],
              letterSpacing: 1.1,
            ),
          ),
        ),
        body: Stack(
          children: [
            backGround(context), // background widget
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AvatarGlow(
                        startDelay: Duration(milliseconds: 50),
                        glowColor: Colors.blue,
                        endRadius: 80.0,
                        duration: Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: Duration(milliseconds: 100),
                        child: Material(
                          elevation: 12.0,
                          shape: CircleBorder(),
                          child: CircleAvatar( // plugin to flag effects
                            backgroundColor: Colors.grey[100],
                            backgroundImage: NetworkImage(widget.cov.flag), // image link from passed param
                            radius: 48,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1.5,
                  ),
                  details(
                      context: context,
                      name: "Name",
                      val: widget.cov.country, //country name from passed param
                      link: 'assets/images/empty.png'),
                  details(
                      context: context,
                      name: "All Case", // number of cases from passed param
                      val: widget.cov.cases.toString(),
                      link: 'assets/images/Cases.png'),
                  details(
                      context: context,
                      name: "Active", // number of active from passed param
                      val: widget.cov.active.toString(),
                      link: 'assets/images/active.png'),
                  details(
                      context: context,
                      name: "Death", //number of death from passed param
                      val: widget.cov.deaths.toString(),
                      link: 'assets/images/deathes.png'),
                  details(
                      context: context,
                      name: "Recover", // number of recover from passed param
                      val: widget.cov.recovered.toString(),
                      link: 'assets/images/recover.png'),
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 16, 8, 8),
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: myColor1[4]),
                      borderRadius: BorderRadius.all(
                        Radius.circular(24.0),
                      ),
                    ),
                    child: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? pieChartWidget(context, widget.cov.active,
                            widget.cov.deaths, widget.cov.recovered)
                        : null,    // the chart is disable when mobile in landscape mode
                  ),
                  Container(
                      alignment: Alignment(0.0, 0.0),
                      child: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? Text(
                              "Last Updated at: " +
                                  formatTime(widget.cov.updated), // convert time stamp to time ago 
                              style: GoogleFonts.lato(
                                  color: myColor1[0],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1))
                          : null)
                ],
              ),
            ),
          ],
        ));
  }
}
