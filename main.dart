import 'package:flutter/material.dart';
import 'package:google_clone/Layout/mobile_screen_layout.dart';
import 'package:google_clone/Layout/responsive_screen_layout.dart';
import 'package:google_clone/Layout/web_screen_layout.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(

      ),
         home: const ResponsiveScreenLayout(
        mobileScreenLayout: MobileScreenLayout() ,
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}


