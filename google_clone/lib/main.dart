import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/responsive/mobile_screen_layout.dart';
import 'package:google_clone/responsive/responsive_layout.dart';
import 'package:google_clone/responsive/web_screen_layout.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: backgroundColor 
    ),
    title: "Google clone",
    home: ResponsiveLayoutScreen(
        mobileScreenLayout:MobileScreenLayout(),
        webScreenLayout: WebScreenLayout()),
  ));
}
