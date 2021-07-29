
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme()=>ThemeData(
  primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    elevation: 0.0,
    backgroundColor: Colors.white,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
        color: Colors.black
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 20,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.deepOrange,
    type: BottomNavigationBarType.fixed,
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black
      )
  ),
);
ThemeData darkTheme()=>ThemeData(
  primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    elevation: 0.0,
    backgroundColor: HexColor('333739'),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('333739'),
        statusBarIconBrightness: Brightness.light
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
        color: Colors.white
    ),
  ),
  scaffoldBackgroundColor: HexColor('333739'),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 20,
    backgroundColor: HexColor('333739'),
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.deepOrange,
    type: BottomNavigationBarType.fixed,
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white
      )
  ),
);