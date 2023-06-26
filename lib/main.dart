import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_authentication_bloc/firebase_options.dart';
import 'package:phone_authentication_bloc/screens/signin_screen.dart';

void main() {
  _initialFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignIn(),
    );
  }
}

_initialFirebase()async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}