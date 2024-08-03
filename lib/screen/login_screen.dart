import 'package:flutter/material.dart';
import 'package:zomet/resources/auth_methods.dart';
import 'package:zomet/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Start or Join a meeting',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              child: Image.asset('assets/images/boarding.jpg'),
            ),
            CustomButton(
              txt: 'Login',
              onpressed: () async {
                bool res = await _authMethods.signInWithGoogle(context);
                print('SignRes $res');
                if (res) {
                  Navigator.pushNamed(context, '/home');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
