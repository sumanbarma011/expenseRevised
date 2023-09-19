import 'package:expense_revised/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final kDarkScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 5, 99, 125));
  final kcolorScheme =
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kDarkScheme.onPrimaryContainer,
            foregroundColor: kDarkScheme.onPrimary),
        cardTheme: const CardTheme().copyWith(
          color: kDarkScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkScheme.primaryContainer),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kcolorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kcolorScheme.onPrimaryContainer,
            foregroundColor: kcolorScheme.onPrimary),
        cardTheme: const CardTheme().copyWith(
          color: kcolorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kcolorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kcolorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      themeMode: ThemeMode.dark,
      home: const Expenses(),
    );
  }
}
