import 'package:flutter/material.dart';
import 'package:rent_app/pages/home.dart';

 const  mcgpalette0 = {
  50: Color(0xFFE3F8F3),
  100: Color(0xFFBAEDE0),
  200: Color(0xFF8CE2CB),
  300: Color(0xFF5ED6B6),
  400: Color(0xFF3CCDA7),
  500: Color(_mcgpalette0PrimaryValue),
  600: Color(0xFF16BE8F),
  700: Color(0xFF12B684),
  800: Color(0xFF0EAF7A),
  900: Color(0xFF08A269),
};
 const int _mcgpalette0PrimaryValue = 0xFF19C497;

 const MaterialColor mcgpalette0Accent = MaterialColor(_mcgpalette0AccentValue, <int, Color>{
  100: Color(0xFFCEFFEB),
  200: Color(_mcgpalette0AccentValue),
  400: Color(0xFF68FFC1),
  700: Color(0xFF4EFFB6),
});
 const int _mcgpalette0AccentValue = 0xFF9BFFD6;

void main() {
  MaterialColor colorCustom =
      MaterialColor(_mcgpalette0PrimaryValue, mcgpalette0);

  runApp(MaterialApp(
    theme: ThemeData(
        fontFamily: 'Kanit',
        //primaryColor: Color.fromRGBO(25, 196, 156, 1),
        primarySwatch: colorCustom),
    home: const HomePage(),
  ));
}
