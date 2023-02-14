import 'package:flutter/material.dart';
import 'package:quran_app_project/views/azkar.dart';
import 'package:quran_app_project/views/home.dart';
import 'package:quran_app_project/views/quran_page.dart';
import 'package:quran_app_project/views/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        HomePage.id: (context) => HomePage(),
        QuranPage.id: (context) => QuranPage(),
        Azkar.id: (context) => Azkar(),
      },
    );
  }
}
