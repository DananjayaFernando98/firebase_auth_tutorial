import 'package:flutter/material.dart';
import 'package:firebase_auth_tutorial/constants/description.dart';
import '../../constants/color.dart';
import '../../constants/style.dart';
import '../../services/auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: const Text("REGISTER"),
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
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 20,
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
                        height: 20,
                      ),
                      const Text(
                        "Register with social accounts ",
                        style: descriptionStyle,
                      ),
                      const SizedBox(
                        height: 10,
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
                        height: 20,
                      ),
                      //register
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Do you have an account?",
                            style: descriptionStyle,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            //Goto the register page
                            onTap: () {},
                            child: const Text(
                              "LOGIN",
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
                            child: Text(
                              "REGISTER",
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
