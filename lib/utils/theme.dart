import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:google_fonts/google_fonts.dart';

class ThemeStyle {
  BuildContext context;

  ///
  /// Colors Values for Project
  static late Color? iconColor;
  static late Color? iconSelectedColor;
  static late Color? backgroundColor;
  static late Color? appBarColor;
  static late Color primaryColor;
  static late Color accentColor;
  static late Color secondryColor;

  ///
  /// Fixed SizedBox Widgets
  static const w5 = SizedBox(width: 5);
  static const SizedBox w10 = SizedBox(width: 10);
  static const SizedBox w20 = SizedBox(width: 20);
  static const SizedBox h5 = SizedBox(height: 5);
  static const SizedBox h10 = SizedBox(height: 10);
  static const SizedBox h20 = SizedBox(height: 20);

  ///
  /// TextStyle
  static TextStyle smallText = GoogleFonts.openSans(
    fontSize: 14,
  );
  static TextStyle smallTextWH = GoogleFonts.openSans(
    fontSize: 14,
    color: Colors.white,
  );
  static TextStyle mediumText = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle mediumTextWH = GoogleFonts.openSans(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle largeText = GoogleFonts.openSans(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle largeTextWH = GoogleFonts.openSans(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  ThemeStyle(this.context) {
    loadStyle();
    log('Theme Style get loaded ===>');
  }

  loadStyle() {
    iconColor = Theme.of(context).iconTheme.color;
    accentColor = Colors.deepPurpleAccent;
    primaryColor = Colors.deepPurple;
    secondryColor = Colors.purple;
    appBarColor = Theme.of(context).appBarTheme.backgroundColor;
  }
}
