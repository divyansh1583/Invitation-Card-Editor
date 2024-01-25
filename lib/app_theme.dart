import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 234, 46, 112),
  background: const Color.fromARGB(255, 216, 185, 202),
);

final theme = ThemeData().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: colorScheme.onPrimary,
    selectedItemColor: colorScheme.background,
    unselectedItemColor: colorScheme.background,
  ),
  textTheme: GoogleFonts.robotoCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.robotoCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.robotoCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.robotoCondensed(
      fontWeight: FontWeight.bold,
    ),
  ),
);
