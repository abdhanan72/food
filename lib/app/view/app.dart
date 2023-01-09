import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:food/l10n/l10n.dart';
import 'package:food/login/view/login.dart';
import 'package:food/sharedpref/view/sharedpref.dart';
import 'package:food/splash/view/splash.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
   const App({super.key});

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.yeonSungTextTheme(),
        appBarTheme: const AppBarTheme(color: Color(0xFFF50514)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFFF50514),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: SplashScreen()
    );
  }
}
