import 'package:flutter/material.dart';
import 'package:phone_authentication_bloc/screens/verify_phone_screen.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Phone Authentication'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text('Sign Up'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerifyPageScreen(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
