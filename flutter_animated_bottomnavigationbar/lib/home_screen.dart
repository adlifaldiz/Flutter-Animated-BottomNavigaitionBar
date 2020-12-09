import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_bottomnavigationbar/screens/account_screen.dart';
import 'package:flutter_animated_bottomnavigationbar/screens/dashboard_screen.dart';
import 'package:flutter_animated_bottomnavigationbar/screens/favorite_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    DashboardScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];

  void _onPageChanged(int index) {}

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.light, //status barIcon Brightness
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tekan lagi untuk keluar'),
        ),
        child: PageView(
          controller: _pageController,
          children: _screens,
          onPageChanged: _onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 57,
        color: Color(0xFF74b9ff),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color(0xFF74b9ff),
        items: <Widget>[
          FaIcon(
            FontAwesomeIcons.dashcube,
            color: Colors.white,
          ),
          FaIcon(
            FontAwesomeIcons.heartbeat,
            color: Colors.white,
          ),
          FaIcon(
            FontAwesomeIcons.userAlt,
            color: Colors.white,
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
