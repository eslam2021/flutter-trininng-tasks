import 'package:firist_project/task1/layout/Start.dart';
import 'package:flutter/material.dart';

import 'task1/shared/component/Colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      useInheritedMediaQuery: true,


      home:IntroScreen()

    );
  }
}


