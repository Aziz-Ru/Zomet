import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zomet/firebase_options.dart';
import 'package:zomet/screen/home_screen.dart';
import 'package:zomet/screen/login_screen.dart';
import 'package:zomet/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zomet',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen()
      },
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
