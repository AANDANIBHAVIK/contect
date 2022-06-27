import 'package:contect/detail.dart';
import 'package:contect/home.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => home(),
        '/detail':(context) => Detail(),
      },
    )
  );
}