import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesHelper  {



  static Future<String> getCountryName() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('countryName').toString();
  }


  static Future<String> setCountryName(String value) async {

     SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString('countryName', value).toString();
  }



}