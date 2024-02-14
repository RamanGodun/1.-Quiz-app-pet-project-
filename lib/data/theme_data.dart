import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimaryColor = Color.fromARGB(255, 121, 240, 238);
const Color kOnPrimaryColor = Colors.white;

final kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 121, 240, 238),
  secondary: const Color.fromARGB(255, 200, 242, 250),
).copyWith();

final kDarkTheme = ThemeData.dark().copyWith(
  colorScheme: kDarkColorScheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      maximumSize: const Size(double.infinity, double.infinity),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      backgroundColor: kPrimaryColor,
      foregroundColor: kOnPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  textTheme: kTextThemeData,
);

CupertinoThemeData getCupertinoTheme() {
  return CupertinoThemeData(
    primaryColor: CupertinoColors.systemBlue.withOpacity(0.7),
    scaffoldBackgroundColor: kDarkTheme.canvasColor,
    // textTheme: const CupertinoTextThemeData()
    //     .copyWith(textStyle: kDarkTheme.textTheme.bodyLarge),
    // Інші параметри теми Cupertino
  );
}

final kTextThemeData = GoogleFonts.montserratAlternatesTextTheme().copyWith(
  titleMedium: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ),
  bodyMedium: const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 13,
  ),
  bodySmall: const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12,
  ),
);
