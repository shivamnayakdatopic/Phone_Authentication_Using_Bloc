import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_authentication_bloc/cubits/auth_cubit/auth_cubit.dart';
import 'package:phone_authentication_bloc/cubits/auth_cubit/auth_state.dart';
import 'package:phone_authentication_bloc/screens/verify_phone_screen.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  TextEditingController phoneValue = TextEditingController();

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
              TextField(
                controller: phoneValue,
                maxLength: 10,
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              const SizedBox(height: 20.0),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthCodeSentState) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyPageScreen()));
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ElevatedButton(
                    child: const Text('Sign Up'),
                    onPressed: () {
                      // We have to give this country code. here
                      String phoneNumber = "+91" + phoneValue.text;
                      BlocProvider.of<AuthCubit>(context).sendOTP(phoneNumber);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
