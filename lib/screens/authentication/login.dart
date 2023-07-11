import 'package:firebase_auth_tutorial/constants/color.dart';
import 'package:firebase_auth_tutorial/constants/description.dart';
import 'package:firebase_auth_tutorial/constants/style.dart';
import 'package:firebase_auth_tutorial/services/auth.dart';
import 'package:flutter/material.dart';

class Sign_In extends StatefulWidget {
  //function
  final Function toggle;
  const Sign_In({super.key, required this.toggle});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  //ref for the AuthSrvoces class in the auth.dart
  final AuthServices _auth = AuthServices();

  //form key
  final _formKey = GlobalKey<FormState>();

  //email & password state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgblack,
      appBar: AppBar(
        backgroundColor: bgblack,
        title: const Text("Log in"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Column(
            children: [
              //description
              const Text(
                description,
                style: descriptionStyle,
              ),
              Center(
                child: Image.asset(
                  "assets/images/firebase.png",
                  height: 150,
                  width: 300,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //email
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: textInputDecoration,
                        validator: (val) =>
                            val!.isEmpty ? "Enter Valid Email" : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //password
                      TextFormField(
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration:
                            textInputDecoration.copyWith(hintText: "password"),
                        validator: (val) =>
                            val!.length < 6 ? "Enter a Valid Password" : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      //google
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        error,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Login with social accounts ",
                        style: descriptionStyle,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        //Google Sign In
                        onTap: () {},
                        child: Center(
                          child: Image.asset(
                            "assets/images/google.png",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //register
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Do haven't an account?",
                            style: descriptionStyle,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            //Goto the register page
                            onTap: () {
                              widget.toggle();
                            },
                            child: const Text(
                              "REGISTER",
                              style: TextStyle(
                                  color: mainBlue, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),

                      //button
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        //Method for login user
                        onTap: () async {
                          dynamic result = await _auth
                              .signInUsingEmailAndPassword(email, password);

                          if (result == null) {
                            setState(() {
                              error = "Could not signin with those credentials";
                            });
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                              color: bgblack,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 2,
                                color: mainYellow,
                              )),
                          child: const Center(
                            child: Text(
                              "LOG IN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //anonymos
                      GestureDetector(
                        //Method for login anonymous
                        onTap: () async {
                          await _auth.signInAnonymously();
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                              color: bgblack,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 2,
                                color: mainYellow,
                              )),
                          child: const Center(
                            child: Text(
                              "LOGIN As GUEST",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






// ElevatedButton(
//         child: const Text("Sign in Anonymously"),
//         onPressed: () async {
//           dynamic result = await _authServices.signInAnonymously();
//           if (result == Null) {
//             print("errpr in sign in");
//           } else {
//             print("sign in anonymously");
//             print(result.uid);
//           }
//         },
//       ),