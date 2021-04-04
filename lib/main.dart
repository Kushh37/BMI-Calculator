import 'package:bmicalculator/Screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'bmi_store.dart';
import 'constants.dart';

void main() => runApp(VxState(store: BMIStore(), child: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData.dark().copyWith(
          primaryColor: aBackground, scaffoldBackgroundColor: aBackground),
    );
  }
}
