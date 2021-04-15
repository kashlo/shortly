import 'package:flutter/material.dart';

class ThemeProvider {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: lightGrey,
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 18),
      bodyText2: TextStyle(fontSize: 18),
    ).apply(
      bodyColor: purple2,
      displayColor: purple2,
    ),
    fontFamily: 'Poppins',
    accentColor: teal, // CircularProgressIndicator color
    appBarTheme: appBarTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    dividerTheme: dividerTheme,
    inputDecorationTheme: inputDecorationTheme,
  );

  //  Colors
  static const Color teal = Color(0xff2bd1d1);
  static const Color purple = Color(0xff3a3053);
  static const Color purple2 = Color(0xff33303b);
  static const Color darkPurple = Color(0xff232027);
  static const Color lightGrey = Color(0xfff0f1f6);
  static const Color darkGrey = Color(0xff9e9da3);
  static const Color red = Color(0xfff56062);
  static const Color white = Color(0xffFFFFFF);

  //  Dimens
  static const double horizontalPadding = 24;
  static const double cornerRadius50 = 50;
  static const double cornerRadius6 = 6;

  static AppBarTheme get appBarTheme {
    return AppBarTheme(
      elevation: 0,
      centerTitle: false,
      color: white,
      iconTheme: IconThemeData(
        color: darkGrey,
      ),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontFamily: 'Poppins',
          color: darkPurple,
          fontWeight: FontWeight.bold,
          fontSize: 30
        )
      )
    );
  }

  static ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            color: white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins'
          )
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeProvider.cornerRadius50)
          )
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 50
          )
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return darkGrey;
          }
          return teal;
        }),
      ),
    );
  }

  static InputDecorationTheme get inputDecorationTheme {
    return InputDecorationTheme(
      labelStyle: TextStyle(
        fontSize: 20,
        color: purple2
      ),
      fillColor: white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: white, width: 3),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: white, width: 3),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red, width: 3),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red, width: 3),
      ),
      errorStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
    );
  }

  static DividerThemeData get dividerTheme {
    return DividerThemeData(
      color: darkGrey.withOpacity(0.5),
      thickness: 1,
      space: 25
    );
  }
}