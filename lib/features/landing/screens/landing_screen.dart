import 'package:flutter/material.dart';
import '../../../colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              'Welcome to TopChat',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: size.height/9),
            Image.asset(
              'assets/bg.png',
               height: 340,
               width: 340,
               color: messageColor,
            ),
            SizedBox(height: size.height / 9),
            const Text('Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.'),
          ],
        ),
      ),
    );
  }
}
