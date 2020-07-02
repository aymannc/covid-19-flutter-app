import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

import 'main_menu.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.dark,
      primaryColor: Color(black),
      accentColor: Color(offWhite),
      textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: GoogleFonts.firaSans(
            textStyle: TextStyle(
                fontSize: 30.0, letterSpacing: .5, color: Color(black)),
          )),
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyMenu(),
      backgroundColor: Color(offWhite),
      appBar: AppBar(
        title:
            Padding(padding: const EdgeInsets.all(8.0), child: Text("Be Safe")),
      ),
      body: Center(
        child: Text(
          "Hello World",
        ),
      ),
    );
  }
}