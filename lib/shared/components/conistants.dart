// base url : https://newsapi.org/
// method : v2/top-headlines?
// query : country=eg&category=business&apiKey=79c83924f52c4cc2bbcc9b34c9ad40d5

// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=79c83924f52c4cc2bbcc9b34c9ad40d5

// https://newsapi.org/v2/everything?q=tesla&apiKey=79c83924f52c4cc2bbcc9b34c9ad40d5

// https://newsapi.org/v2/everything?domains=wsj.com&apiKey=79c83924f52c4cc2bbcc9b34c9ad40d5

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightMode() => ThemeData(
      primarySwatch: Colors.deepOrange,
      appBarTheme: AppBarTheme(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        color: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: 'Raleway',
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 15,
          fontFamily: 'Raleway',
          wordSpacing: 1,
          letterSpacing: .5,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
      ),
    );
ThemeData darkMode() => ThemeData(
      primarySwatch: Colors.deepOrange,
      appBarTheme: AppBarTheme(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blueGrey[900],
          statusBarIconBrightness: Brightness.light,
        ),
        color: Colors.blueGrey[900],
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: 'Raleway',
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.blueGrey[900],
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 15,
          fontFamily: 'Raleway',
          wordSpacing: 1,
          letterSpacing: .5,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
      ),
    );
