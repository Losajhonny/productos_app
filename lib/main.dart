import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';

void main() {
  runApp(MayApp());
}

class MayApp extends StatelessWidget {
  const MayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos app',
      initialRoute: 'login',
      routes: {'login': (_) => LoginScreen(), 'home': (_) => HomeScreen()},
    );
  }
}