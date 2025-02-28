// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:shared/features/auth/login.dart';
// import 'package:shared/features/auth/sign_up.dart';
// import 'package:shared/features/pages/home/home.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Splash extends StatefulWidget {
//   const Splash({super.key});
//
//   @override
//   State<Splash> createState() => SplashState();
// }
//
// class SplashState extends State<Splash> {
//   static const String loginKey = "Login";
//
//   @override
//   void initState() {
//     whereTo();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Icon(
//           Icons.accessibility,
//           size: 60,
//           color: Colors.blue,
//         ),
//       ),
//     );
//   }
//
//   void whereTo() async {
//     var sharedPref = await SharedPreferences.getInstance();
//     var isLogIN = sharedPref.getBool(loginKey);
//
//     Timer(Duration(seconds: 2), () {
//       if (isLogIN != null) {
//         if (isLogIN) {
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => Home()));
//         } else {
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => Login()));
//         }
//       } else                                                                                                                                            {
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => Login()));
//       }
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared/features/auth/login.dart';
import 'package:shared/features/pages/home/home.dart';
import 'package:shared/features/pages/onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    await Future.delayed(Duration(seconds: 2)); // Simulating splash delay

    if (isFirstTime) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingPage()),
      );
    } else if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()), // user login and skip login page throw DashboardPage
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),// user no login and throw login page
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
