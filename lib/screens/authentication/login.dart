import 'package:firebase_auth_tutorial/constants/color.dart';
import 'package:firebase_auth_tutorial/constants/description.dart';
import 'package:firebase_auth_tutorial/constants/style.dart';
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

  //form key
  final _formKey = GlobalKey<FormState>();

  //email & password state
  String email = "";
  String password = "";

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
                  "assets/images/login.jpg",
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
                        decoration: textInputDecoration,
                        validator: (value) =>
                            value?.isEmpty == true ? "Enter Valid Email" : null,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //password
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: "password"),
                        validator: (value) =>
                            value!.length < 6 ? "Enter a Valid Password" : null,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      //google
                      const SizedBox(
                        height: 15,
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
                            onTap: () {},
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
                        onTap: () {},
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
                            child: const Text(
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
                        onTap: () {},
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
                            child: const Text(
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