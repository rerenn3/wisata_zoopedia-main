import 'package:flutter/material.dart';
import 'package:wisata_zoopedia/data/zoo_data.dart';
import 'package:wisata_zoopedia/models/zoo.dart';
import 'package:wisata_zoopedia/screens/favorite_screen.dart';
import 'package:wisata_zoopedia/screens/main_screen.dart';
import 'package:wisata_zoopedia/screens/sign_in_screen.dart';
import 'package:wisata_zoopedia/screens/detail_screens.dart';
import 'package:wisata_zoopedia/screens/home_screens.dart';
import 'package:wisata_zoopedia/screens/profile_screen.dart';
import 'package:wisata_zoopedia/screens/search_screens.dart';
import 'package:wisata_zoopedia/screens/sign_up_screen.dart';

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
      title: 'Wisata Zoopedia',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/home': (context) => HomeScreen(),
      '/sign_up': (context) => SignUpScreen(),
      '/sign_in': (context) => SignInScreen(),
      '/search': (context) => SearchScreen(),
      '/detail': (context) => DetailScreen(zoo: zooList[0]),
      '/profile': (context) => ProfileScreen(),

      // home: DetailScreen(zoo: zooList[0]),
      // home: HomeScreen(),
      // home: SearchScreen(),
      // home: ProfileScreen(),
      // home: SignInScreen(),
      // home : SignUpScreen(),
      //home: MainScreen(),
     },
    );
  }
}





