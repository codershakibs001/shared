// import 'package:flutter/material.dart';
//
// class SignUp extends StatelessWidget {
//   const SignUp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Text("shakib"),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared/features/pages/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool('isLoggedIn', true);
            prefs.setBool('isFirstTime', false);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
          },
          child: Text("Sign Up"),
        ),
      ),
    );
  }
}
