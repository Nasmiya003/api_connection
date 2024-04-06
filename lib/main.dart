// ignore: unused_import
import 'package:api_connection/models/user_model.dart';
import 'package:api_connection/services/userdata.dart';
import 'package:api_connection/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => UserProvider(),
        // ignore: prefer_const_constructors
        child:UA(),
      ),
    );
  }
}