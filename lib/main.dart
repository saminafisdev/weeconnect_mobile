import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/communities_screen.dart';
import 'screens/explore_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/messages_screen.dart';

void main() {
  runApp(const WeeConnectApp());
}

class WeeConnectApp extends StatelessWidget {
  const WeeConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeeConnect',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark, // Enable dark mode
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark, // Ensure dark mode color scheme
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

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    CommunitiesScreen(),
    ExploreScreen(),
    NotificationsScreen(),
    MessagesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeeConnect'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const <NavigationDestination>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.group), label: 'Communities'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Explore'),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          NavigationDestination(icon: Icon(Icons.message), label: 'Messages'),
        ],
      ),
    );
  }
}
