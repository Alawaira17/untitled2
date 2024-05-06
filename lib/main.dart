// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'UserListView.dart';

// Import your home page class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserListView(), // Set your home page here
    );
  }
}