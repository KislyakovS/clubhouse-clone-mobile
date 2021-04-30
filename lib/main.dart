import 'package:clubhouse_clone/screens/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:clubhouse_clone/config/palette.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clubhouse Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Palette.background),
          scaffoldBackgroundColor: Palette.background,
          primaryColor: Colors.white,
          accentColor: Palette.green,
          iconTheme: const IconThemeData(color: Colors.black),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: GoogleFonts.montserratTextTheme()),
      home: HomeScreen(),
    );
  }
}
