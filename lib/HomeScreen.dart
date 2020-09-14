import 'package:covid_app/Pages/MyDrawer.dart';
import 'package:covid_app/Pages/ChartWidget.dart';
import 'package:covid_app/Pages/background.dart';
import 'package:covid_app/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:time_formatter/time_formatter.dart';
import 'Pages/CardWidget.dart';
import 'countryList.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'myColor.dart';

class HomeScreen extends StatefulWidget {
  final String country;
  @override
  _HomeScreenState createState() => _HomeScreenState();

  HomeScreen(this.country);
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> map = new Map();
  var isLoading = false;
  String countryName;

  _fetchData(String countryName) async {
    setState(() {
      isLoading = true;
    });

    final response =
        await http.get("https://corona.lmao.ninja/v2/countries/$countryName");
    if (response.statusCode == 200) {
      map = json.decode(response.body);

      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  initState() {
    super.initState();

    _fetchData(widget.country);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor1[0],
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
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
        title: Text("COVID-19 Statistics",
            style: GoogleFonts.lato(fontStyle: FontStyle.normal)),
        centerTitle: true,
        iconTheme: new IconThemeData(color: myColor1[2]),
      ),
      drawer: MediaQuery.of(context).orientation ==
          Orientation.portrait ?MyDrawer() : null,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          backGround(context),
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 9,
                child: Center(
                  child: Text(widget.country,
                      style: GoogleFonts.lato(
                          color: myColor1[0],
                          fontSize: 28,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  child: isLoading
                      ? Center(
                          child: JumpingText(
                            'Loading...',
                            style: TextStyle(
                                fontFamily: "SourceSansPro",
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: myColor1[0]),
                          ),
                        )
                      : Container(
                          width: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.width / 1.2
                              : MediaQuery.of(context).size.width / 1.1,
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.height / 2.6
                              : MediaQuery.of(context).size.height / 2,
                          child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount:
                                MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? 2
                                    : 3,
                            crossAxisSpacing: 0,
                            childAspectRatio:
                                MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? 5 / 3
                                    : 8 / 3,
                            mainAxisSpacing: 0,
                            children: <Widget>[
                              cardWidget(
                                  context, "Cases", map["cases"].toString()),
                              cardWidget(
                                  context, "Active", map["active"].toString()),
                              cardWidget(context, "Recovered",
                                  map["recovered"].toString()),
                              cardWidget(
                                  context, "Deaths", map["deaths"].toString()),
                              cardWidget(context, "Today Cases",
                                  map["todayCases"].toString()),
                              cardWidget(context, "Today Recover",
                                  map["todayRecovered"].toString()),
                            ],
                          ))),
              Container(
                  child: !isLoading
                      ? MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0, color: myColor1[4]),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(24.0),
                                    ),
                                  ),
                                  child: pieChartWidget(context, map["active"],
                                      map["deaths"], map["recovered"]),
                                ),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  child: Text(
                                      "Last Updated at: " +
                                          formatTime(map["updated"]),
                                      style: GoogleFonts.lato(
                                          color: myColor1[0],
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1)),
                                )
                              ],
                            )
                          : null
                      : null),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Center(
              child: Container(
                margin: EdgeInsets.all(28),
                width: MediaQuery.of(context).size.width / 1.2,
                height: 48,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        side: BorderSide(color: myColor1[4])),
                    elevation: 5,
                    color: myColor1[0].withOpacity(0.9),
                    child: Text("Choose other Country",
                        style: GoogleFonts.lato(
                            color: myColor1[2],
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CountryList();
                      }));
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
