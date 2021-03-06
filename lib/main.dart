import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_splashscreen/simple_splashscreen.dart';
import 'HomeScreen.dart';

void main() {
  runApp(new MaterialApp(
    theme: ThemeData(
      fontFamily: "SourceSansPro",
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  String countryName;

  Future<void> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String country = prefs.getString('countryName').toString();
    Future.delayed(Duration(seconds: 1), () async { // delay time for read pref data
      setState(() {
        if (country != "null")
          countryName = country;
        else
          countryName = "Syrian Arab Republic"; // set default country when init app for first time
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getSharedPrefs(); // load pref
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          child: Simple_splashscreen(
        context: context,
        gotoWidget: HomeScreen(countryName),
        splashscreenWidget: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash.png'), // background for splash
                fit: BoxFit.cover),
          ),
        ),
        timerInSeconds: 3, // duration for splash screen
      )),
    );
  }
}
