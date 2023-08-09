import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:topchat_ui/common/widgets/loader.dart';
import 'package:topchat_ui/features/auth/controller/auth_controller.dart';
import 'package:topchat_ui/firebase_options.dart';
import 'package:topchat_ui/router.dart';
import './colors.dart';
import './features/landing/screens/landing_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '././screens/mobile_chat_screen.dart';
import '././screens/mobile_screen_layout.dart';
import 'common/widgets/error.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Topchat',
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: const AppBarTheme(
              color: appBarColor,
            ),
          ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return const LandingScreen();
              }
              return const MobileScreenLayout();
            },
            error: (err, trace) {
              return ErrorScreen(
                error: err.toString(),
              );
            },
            loading: () => const Loader(),
       ),
    );
  }
}
