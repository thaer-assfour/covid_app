import 'package:covid_app/Pages/background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:progress_indicators/progress_indicators.dart';
import 'CountryDetails.dart';
import 'covid.dart';
import 'myColor.dart';

class CountryList extends StatefulWidget {
  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  List data;
  List<Covid> list;
 var isLoading = false;


  Future<String> getData() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get('https://corona.lmao.ninja/v2/countries');
    this.setState(() {
      data = jsonDecode(response.body);
      final convertedJsonObject = data.cast<Map<String, dynamic>>(); //edited
      list = convertedJsonObject.map<Covid>((json) => Covid.fromJson(json)).toList(); //edited
    });

    setState(() {
      isLoading = false;
    });


    return "Success!";

  }

  @override
  // ignore: must_call_super
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: myColor1[0],
        elevation: 4,
        title: Text(
          "Choose Country",
            style: GoogleFonts.lato(
                fontStyle: FontStyle.normal,
                color: myColor1[2],letterSpacing: 1.1,
            ),
        ),
        centerTitle: true,
        iconTheme: new IconThemeData(color: myColor1[2]),
      ),
      body: Stack(
        children: [
          backGround(context),
          isLoading
              ? Center(
                child: JumpingText(
            'Loading...',
                    style: GoogleFonts.lato(
                        color: myColor1[0],
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1)
          ),
              )
              : new ListView.builder(
            dragStartBehavior: DragStartBehavior.start,
            padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
            itemCount: list == null ? 0 : list.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shadowColor: myColor1[0],
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                    side: BorderSide(
                        color:myColor1[4], width: 1)),
                child: ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CountryDetails(cov: list[index]);
                      }));
                    },
                    title: Text(
                      list[index].country,
                        style: GoogleFonts.lato(
                            color: myColor1[0],
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.1)
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: myColor1[1],
                      backgroundImage:
                          NetworkImage(list[index].flag),
                      radius: 24,
                    )),
              );
            },
          ),
        ],
      ),
    );
  }
}
