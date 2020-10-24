import 'package:flutter/material.dart';
import 'package:nasa_app/view/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NASA",
      home: Scaffold(
        body: HomePage(),
      ),
    ),
  );
}
