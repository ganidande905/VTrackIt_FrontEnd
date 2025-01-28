import 'package:flutter/material.dart';
import 'package:v_track_it_frontend/app/modules/Login/view/loginpage.dart';
import 'package:v_track_it_frontend/app/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'V-Track-It',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: kPrimaryBackgroundColor,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: kNavbarColor,
          elevation: 0,
        )
      ),
      home: const Loginpage(),
    );
  }
}

