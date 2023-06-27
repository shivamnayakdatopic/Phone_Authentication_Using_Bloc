import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_authentication_bloc/cubits/auth_cubit/auth_cubit.dart';
import 'package:phone_authentication_bloc/cubits/auth_cubit/auth_state.dart';
import 'package:phone_authentication_bloc/firebase_options.dart';
import 'package:phone_authentication_bloc/screens/home_screen.dart';
import 'package:phone_authentication_bloc/screens/signin_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // We have to do Initialize Flutter binding 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap with blocProvider,because of can get instance of Cubit.
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (oldState, newState) {
              return oldState is AuthInitialState;
            },
            builder: (context, state) {
              if (state is AuthLoggedInState) {
                return HomeScreen();
              } else if (state is AuthLoggedOutState) {
                return SignIn();
              } else {
                return const Scaffold();
              }
            },
          ),
        ));
  }
}
