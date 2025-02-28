import 'package:flutter/material.dart';
import 'package:shared/features/auth/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Onboarding")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool('isFirstTime', false);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignUpPage()),
            );
          },
          child: Text("Get Started"),
        ),
      ),
    );
  }
}