import 'package:amazon/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon/utils/theme.dart';
import 'package:amazon/view/auth_screen/auth_screens.dart';
import 'package:amazon/view/auth_screen/otp_screen.dart';
import 'package:amazon/view/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        theme: theme,
        // home: AuthScreen(),
        home: HomeScreen(),
        // home: OTPScreen(
        //   mobileNumber: '+91 8709575112',
        // ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
