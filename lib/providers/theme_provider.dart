import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier{
  static const themeStatus="ThemeStatus";
  bool _darkTheme=false;
  bool get getIsDarkTheme=>_darkTheme;

  ThemeProvider(){
    getTheme();
  }
  setDarkTheme(bool value) async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setBool(themeStatus, value);
    _darkTheme=value;
    notifyListeners();
  }
  Future<bool> getTheme() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    _darkTheme=prefs.getBool(themeStatus)?? false;
    notifyListeners();
    return _darkTheme;
  }
}