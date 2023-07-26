import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:topchat_ui/firebase_options.dart';
import './responsive/responsive_layout.dart';
import './colors.dart';
import './screens/web_screen_layout.dart';
import './screens/mobile_screen_layout.dart';
import './features/landing/screens/landing_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Topchat',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const LandingScreen(),
    );
  }
}
