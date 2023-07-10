import 'package:firebase_auth_tutorial/constants/color.dart';
import 'package:flutter/material.dart';

const TextStyle descriptionStyle = TextStyle(
  color: textLight,
  fontSize: 12,
  fontWeight: FontWeight.w200,
);

const textInputDecoration = InputDecoration(
  hintText: "email",
  hintStyle: TextStyle(
    color: textLight,
    fontSize: 15,
  ),
  fillColor: bgblack,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: mainYellow,
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(100),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: mainYellow,
      width: 1,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(100),
    ),
  ),
);
