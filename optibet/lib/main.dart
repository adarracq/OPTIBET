import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:optibet/src/homePage.dart';
import 'package:optibet/src/lastResultsPage.dart';
import 'package:optibet/src/loginPage.dart';
import 'package:optibet/src/nextGridsPage.dart';
import 'package:optibet/src/nextCompetitionPage.dart';
import 'package:optibet/src/signupPage.dart';
import 'package:optibet/src/gridToCompletePage.dart';
import 'package:optibet/src/profilePage.dart';
import 'package:optibet/src/myGamesPage.dart';
import 'package:optibet/src/config/const.dart';

import 'src/welcomePage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => WelcomePage(),
      '/signup': (context) => SignUpPage(),
      '/login': (context) => LoginPage(),
      '/home': (context) => HomePage(),
      '/lastresults': (context) => LastResultsPage(),
      '/profile': (context) => ProfilePage(),
      '/mygames': (context) => MyGamesPage(),
      '/nextgrids': (context) => NextGridsPage(),
      '/nextcompetitons': (context) => NextCompetitionPage(),
      '/gridtocomplete': (context) => GridToCompletePage(),
    },
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: PRIMARYCOLOR,
        textTheme:GoogleFonts.latoTextTheme(textTheme)
            //.copyWith(bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),),
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}



