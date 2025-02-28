// import 'package:flutter/material.dart';
// import 'package:shared/features/pages/home/home.dart';
// import 'package:shared/features/pages/splash/splash.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Login extends StatelessWidget {
//   const Login({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         spacing: 20,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.accessible_forward_rounded,
//             size: 50,
//             color: Colors.purple,
//           ),
//           TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//             ),
//           ),
//           TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//             ),
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 var sharedPref = await SharedPreferences.getInstance();
//                 sharedPref.setBool(SplashState.loginKey, true);
//
//                 Navigator.pushReplacement(
//                     context, MaterialPageRoute(builder: (context) => Home()));
//               },
//               child: Text("Login")),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared/features/pages/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool('isLoggedIn', true);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
          },
          child: Text("Login"),
        ),
      ),
    );
  }
}
