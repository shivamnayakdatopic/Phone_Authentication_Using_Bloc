

import 'package:flutter/material.dart';

class VerifyPageScreen extends StatelessWidget {
  const VerifyPageScreen({super.key});

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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: '6-Digit OTP',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text('Verify'),
                onPressed: () {
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}