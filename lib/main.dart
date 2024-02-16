import 'package:flutter/material.dart';
import 'package:os_project/AnimatedButtons.dart';
import 'package:os_project/Optimal.dart';
import 'package:os_project/RandomPageReplacment.dart';
import 'package:os_project/SplashScreen.dart';

import 'MRU.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MRU Page Replacement',
      home: SplashScreen(),
    );
  }
}