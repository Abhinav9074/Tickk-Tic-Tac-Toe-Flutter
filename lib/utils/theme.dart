import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
);

class MyTextStyle {
  static const TextStyle largeText = TextStyle(
    color: Color.fromARGB(255, 113, 115, 117),
    fontSize: 35,
    fontWeight: FontWeight.w800,
    fontFamily: 'Montserrat-bold',
    letterSpacing: 0.9,
  );

  static const TextStyle greyTextMedium = TextStyle(
    color: Color.fromARGB(255, 149, 143, 143),
    fontSize: 17,
    fontWeight: FontWeight.w900,
    fontFamily: 'Montserrat-Regular',
    letterSpacing: 0.9,
  );

  static const TextStyle commonHeading = TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 20,
    fontWeight: FontWeight.w900,
    fontFamily: 'Montesserat',
    letterSpacing: 0.9,
  );
  static const TextStyle lightText = TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 20,
    fontWeight: FontWeight.w100,
    fontFamily: 'Montesserat',
    letterSpacing: 0.9,
  );
  static const TextStyle mediumHeading = TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montesserat',
    letterSpacing: 0.9,
  );

  static const TextStyle xIconText = TextStyle(
    color: Color(0xFF46A3FF),
    fontSize: 50,
    fontWeight: FontWeight.w300,
    fontFamily: 'Montesserat',
  );
  static const TextStyle oIconText = TextStyle(
    color: Color(0xFFFF827E),
    fontSize: 50,
    fontWeight: FontWeight.w300,
    fontFamily: 'Montesserat',
  );

  static const TextStyle googleButton = TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 15,
    fontWeight: FontWeight.w900,
    fontFamily: 'Montesserat',
    letterSpacing: 0.9,
  );
}
