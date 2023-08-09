import 'package:flutter/material.dart';
import 'package:topchat_ui/features/auth/screens/login_screen.dart';
import 'package:topchat_ui/features/auth/screens/otp_screen.dart';
import 'package:topchat_ui/features/auth/screens/user_information_screen.dart';
import 'package:topchat_ui/features/select_contacts/screens/select_contacts_screen.dart';
import './common/widgets/error.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          verificationId: verificationId,
        ),
      );
      case UserInformationScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const UserInformationScreen(
        ),
      );
      case SelectContactsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SelectContactsScreen(
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
            body: ErrorScreen(error: 'This page does not exist')),
      );
  }
}