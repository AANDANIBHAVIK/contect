import 'dart:async';

import 'package:contect/screen/detail.dart';
import 'package:contect/screen/home.dart';
import 'package:flutter/material.dart';

bool themedata = true;
StreamController<bool> data = StreamController();

void main() {
  ThemeData dark = ThemeData(
      primarySwatch: Colors.lightGreen,
      backgroundColor: Colors.black,
      primaryColor: Colors.amber,
      scaffoldBackgroundColor: Colors.black);

  ThemeData light = ThemeData(backgroundColor: Colors.white);

  runApp(
    StreamBuilder(
      stream: data.stream,
      initialData: true,
      builder: (context, snapshot) {
        return MaterialApp(
          theme: snapshot.data == true ? light : dark,
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => home(),
            '/detail': (context) => Detail(),
          },
        );
      },
    ),
  );
}
