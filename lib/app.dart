
import 'package:flutter/material.dart';
import 'package:flutter_hotel_app/app/ui/pages/main/main_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/ui/pages/home/home_page.dart';
import 'app/ui/theme/theme_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Hotel App',
      theme: ThemeData(
        textTheme: GoogleFonts.plusJakartaSansTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: ThemeColors.primaryColor),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}