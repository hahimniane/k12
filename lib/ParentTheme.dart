import 'package:flutter/material.dart';
import 'package:maarif_k12/utils/const.dart';

// Custom theme for normal users
class ParentTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: parentAppColor,
        // ···
      ),
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          )),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: parentAppColor,
        unselectedItemColor: parentAppColor,
      ),
      useMaterial3: true,
      brightness: Brightness.light,
      primarySwatch: parentMaterialColor,
      // primarySwatch: parentAppColor,
      primaryColor: parentAppColor, // Normal user color
      // accentColor: Color(0xFF38C0C6), // You can customize other properties as needed
      fontFamily: 'Roboto',
      // ... other customizations for normal users
    );
  }
}

// Custom theme for the admin
class AdminTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: adminAppColor,
        // ···
      ),
      highlightColor: adminAppColor,
      useMaterial3: true,
      tabBarTheme: TabBarTheme(),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: adminAppColor,
        unselectedItemColor: adminAppColor,
      ),
      appBarTheme: AppBarTheme(
          // titleTextStyle: TextStyle(
          //   color: Colors.white,
          //   fontWeight: FontWeight.bold
          // )
          ),
      primarySwatch: adminMaterialColor,
      primaryColor: adminAppColor, // Admin color
      // accentColor: Color(0xFFEF8515), // You can customize other properties as needed
      fontFamily: 'Roboto',
      // ... other customizations for admin
    );
  }
}
