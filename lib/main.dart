import 'package:flutter/material.dart';
import 'package:myapp/Profile.dart';
import 'package:myapp/Report.dart';
import 'package:myapp/loginPage.dart';
import 'package:myapp/home_page.dart';
import 'package:myapp/widgets/bottom_navigation_bar.dart';
import 'package:myapp/transaction_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const TransactionPage(),
    const ReportsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Budget Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      home: const SigninScreen(),
      routes: {
        '/home': (context) => Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
          bottomNavigationBar: MyBottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        '/transactions': (context) => Scaffold(
          body: const TransactionPage(),
          bottomNavigationBar: MyBottomNavigationBar(
            currentIndex: 1,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              switch (index) {
                case 0:
                  Navigator.pushReplacementNamed(context, '/home');
                  break;
                case 1:
                  Navigator.pushReplacementNamed(context, '/transactions');
                  break;
                case 2:
                  Navigator.pushReplacementNamed(context, '/reports');
                  break;
                case 3:
                  Navigator.pushReplacementNamed(context, '/profile');
                  break;
              }
            },
          ),
        ),
        '/reports': (context) => Scaffold(
          body: const ReportsPage(),
          bottomNavigationBar: MyBottomNavigationBar(
            currentIndex: 2,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              switch (index) {
                case 0:
                  Navigator.pushReplacementNamed(context, '/home');
                  break;
                case 1:
                  Navigator.pushReplacementNamed(context, '/transactions');
                  break;
                case 2:
                  Navigator.pushReplacementNamed(context, '/reports');
                  break;
                case 3:
                  Navigator.pushReplacementNamed(context, '/profile');
                  break;
              }
            },
          ),
        ),
        '/profile': (context) => Scaffold(
          body: const ProfilePage(),
          bottomNavigationBar: MyBottomNavigationBar(
            currentIndex: 3,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              switch (index) {
                case 0:
                  Navigator.pushReplacementNamed(context, '/home');
                  break;
                case 1:
                  Navigator.pushReplacementNamed(context, '/transactions');
                  break;
                case 2:
                  Navigator.pushReplacementNamed(context, '/reports');
                  break;
                case 3:
                  Navigator.pushReplacementNamed(context, '/profile');
                  break;
              }
            },
          ),
        ),
      },
    );
  }
}
