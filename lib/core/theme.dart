import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF64FFDA); // Teal/Cyan accent
  static const Color backgroundColor = Color(0xFF0A192F); // Deep Navy
  static const Color cardColor = Color(0xFF112240); // Lighter Navy
  static const Color textPrimary = Color(0xFFCCD6F6); // Off-white
  static const Color textSecondary = Color(0xFF8892B0); // Muted-blue

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    fontFamily: 'Montserrat',
    cardColor: cardColor,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      surface: cardColor,
      background: backgroundColor,
      secondary: primaryColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: textPrimary, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: textPrimary, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: textSecondary),
      bodyMedium: TextStyle(color: textSecondary),
      titleMedium: TextStyle(color: textPrimary, fontWeight: FontWeight.w600),
    ),
  );
}
