import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/home_screen.dart';
import 'package:couldai_user_app/screens/leaderboard_screen.dart';
import 'package:couldai_user_app/screens/library_screen.dart';
import 'package:couldai_user_app/screens/all_series_screen.dart';
import 'package:couldai_user_app/screens/notification_screen.dart';
import 'package:couldai_user_app/screens/profile_screen.dart';
import 'package:couldai_user_app/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CozyCanz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    LeaderboardScreen(),
    LibraryScreen(),
    AllSeriesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Hide the main AppBar for screens that have their own (like Library and Leaderboard)
    final bool showMainAppBar = _selectedIndex == 0;

    return Scaffold(
      appBar: showMainAppBar
          ? AppBar(
              title: const Text('CozyCanz'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
                  },
                ),
                 Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: GestureDetector(
                    onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                    },
                    child: const CircleAvatar(
                      radius: 16,
                      // Placeholder for profile avatar
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                    ),
                  ),
                ),
              ],
            )
          : null,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'All Series',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
