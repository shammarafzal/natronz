import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/bottonNavBar.dart';
import 'Screens/login.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // var prefs = await SharedPreferences.getInstance();
  // var isLoggedIn = (prefs.getBool('isLoggedIn') == null)
  //     ? false
  //     : prefs.getBool('isLoggedIn');

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'bottomNavBar',
      routes: {
        'login': (context) => Login(),
        'bottomNavBar': (context) => BottomNavBar(),
      },
    ),
  );
}
