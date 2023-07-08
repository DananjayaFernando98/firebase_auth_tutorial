import 'package:firebase_auth_tutorial/services/auth.dart';
import 'package:flutter/material.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  //ref for the AuthSrvoces class in the auth.dart
  final AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      body: ElevatedButton(
        child: const Text("Sign in Anonymously"),
        onPressed: () async {
          dynamic result = await _authServices.signInAnonymously();
          if (result == Null) {
            print("errpr in sign in");
          } else {
            print("sign in anonymously");
            print(result.uid);
          }
        },
      ),
    );
  }
}
