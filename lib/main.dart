import 'package:fitness/pages/home.dart';
import 'package:fitness/pages/onBoarding.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => OnBoarding(),
        '/home': (BuildContext context) => HomeScreen(),
      },
      theme: ThemeData(appBarTheme: AppBarTheme(color: Color(0XFF192A56))),
    );
  }
}
