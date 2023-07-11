import 'package:firebase_auth_tutorial/constants/color.dart';
import 'package:firebase_auth_tutorial/constants/description.dart';
import 'package:firebase_auth_tutorial/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //create a obj from Authservice
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgblack,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bgblack,
          actions: [
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(bgblack),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
              child: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "HOME",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textLight,
                      fontSize: 10,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/creditcard.png",
                    height: 400,
                    width: 400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
