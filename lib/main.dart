import 'package:flutter/material.dart';
import 'package:flutter_hotel_app/app/ui/pages/home/home_page.dart';
import 'package:flutter_hotel_app/app/ui/theme/theme_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Hotel App',
      theme: ThemeData(
        textTheme: GoogleFonts.plusJakartaSansTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: ThemeColors.primaryColor),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
