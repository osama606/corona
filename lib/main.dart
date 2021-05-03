import 'package:corona/data_source.dart';
import 'package:corona/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: primaryBlack,
    ),
    home: HomePage(),
  ));
}
