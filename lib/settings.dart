import 'package:covid_app/HomeScreen.dart';
import 'package:covid_app/Pages/background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:progress_indicators/progress_indicators.dart';
import 'myColor.dart';
import 'sharedPrefHelper.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String mySelection;
  var isLoading = false;
  var dataChanged = false;
  final String url = "https://corona.lmao.ninja/v2/countries"; //load country name from api to choose country for shared pref
  List data;

  Future<String> getData() async {
    setState(() {
      isLoading = true;
    });

    var res = await http.get(url);
    var resBody = json.decode(res.body);

    setState(() {
      data = resBody;
      isLoading = false;
    });
    return "Sucess";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: myColor1[0],
        elevation: 4,
        title: Text("Settings",
            style: GoogleFonts.lato(fontStyle: FontStyle.normal)),
        centerTitle: true,
        iconTheme: new IconThemeData(color: myColor1[2]),
      ),
      body: Stack(
        children: [
          backGround(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text("Favorite Country:",
                    style: GoogleFonts.lato(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: myColor1[0])),
              ),
              new Center(
                child: isLoading
                    ? JumpingText('Loading...',
                        style: GoogleFonts.lato(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: myColor1[0]))
                    : Container(
                        child: new DropdownButton(
                          hint: Text("Select Country",
                              style: GoogleFonts.lato(
                                  fontStyle: FontStyle.normal,
                                 // fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: myColor1[0].withOpacity(0.4))),
                          elevation: 12,
                          items: data.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(item['country'],
                                  style: GoogleFonts.lato(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: myColor1[0])),
                              value: item['country'].toString(),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              mySelection = newVal;
                              dataChanged = true;
                            });
                          },
                          value: mySelection,
                        ),
                      ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                height: 48,
                width: MediaQuery.of(context).size.width / 1.2,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        side: BorderSide(color: myColor1[4])),
                    elevation: 6,
                    color: myColor1[0],
                    child: Text("Save Settings",
                        style: GoogleFonts.lato(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: myColor1[2],
                            letterSpacing: 1.1)),
                    disabledColor: myColor1[5].withOpacity(0.4), // color of button when data not change
                    onPressed: dataChanged
                        ? () async {
                            await SharedPreferencesHelper.setCountryName( // save country to shared pref
                                mySelection);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomeScreen(mySelection); //return to home screen with new country data
                            }));
                          }
                        : null),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
