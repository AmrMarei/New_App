import 'package:flutter/material.dart';

import 'home/home_sceen.dart';
import 'home/news/news_details.dart';
import 'my_theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsDetails.routeName: (context) => NewsDetails(),
      },
    );
  }
}

//2f5f73197a8d4b2f8a61583b8c2bba96
