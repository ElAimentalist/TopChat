import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:topchat_ui/features/auth/controller/auth_controller.dart';

import '../../../colors.dart';

class OTPScreen extends ConsumerWidget {
  static const String routeName = '/otp-screen';
  final String verificationId; // Change to StatefulWidget
  const OTPScreen({
    Key? key,
    required this.verificationId,
  }) : super(key: key);

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref
        .read(authControllerProvider)
        .VerifyOTP(context, verificationId, userOTP);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Verify your phone number'),
          elevation: 0,
          backgroundColor: backgroundColor,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text('We have send an SMS with a code.'),
              SizedBox(
                width: size.width * 0.5,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: '- - - - - -',
                    hintStyle: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    if (val.length == 6) {
                      verifyOTP(ref, context, val.trim());
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
