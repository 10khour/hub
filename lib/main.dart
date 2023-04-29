import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hub/proxy.dart';
import 'login.dart';

void main() {
  HttpOverrides.global = ProxiedHttpOverrides(host: "127.0.0.1", port: "7890");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
