import 'package:flutter/material.dart';
import 'package:wisata_zoopedia/data/zoo_data.dart';
import 'package:wisata_zoopedia/models/zoo.dart';
import 'package:wisata_zoopedia/screens/favorite_screen.dart';
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

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class  _MainScreenState extends State<MainScreen> {
  // TODO: 1 Deklarasikan variable
  int _currentIndex = 0;
  final List<Widget> _pages = [
  HomeScreen(),
  SearchScreen(),
  FavoriteScreen(),
  ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2 Buat properti body berupa widget yang ditampilkan
      body: _pages[_currentIndex],
      // TODO: 3 Buat properti BottomNavigationBar dengan nilai Theme
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.lightGreen[50]
          ),
          // TODO: 4 Buat data dan child dari Theme

          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.lightGreen,),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.lightGreen,),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite, color: Colors.lightGreen,),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.lightGreen,),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            selectedItemColor: Colors.lightGreen,
            unselectedItemColor: Colors.black,
            showSelectedLabels: true,
            showUnselectedLabels: true,
          )
      ),

    );
  }
}




