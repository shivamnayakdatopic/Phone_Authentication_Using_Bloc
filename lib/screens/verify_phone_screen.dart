import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_authentication_bloc/cubits/auth_cubit/auth_cubit.dart';
import 'package:phone_authentication_bloc/cubits/auth_cubit/auth_state.dart';
import 'package:phone_authentication_bloc/screens/home_screen.dart';

class VerifyPageScreen extends StatelessWidget {
  VerifyPageScreen({super.key});

  TextEditingController otpValue = TextEditingController();

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
                controller: otpValue,
                maxLength: 6,
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: '6-Digit OTP',
                ),
              ),
              const SizedBox(height: 20.0),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoggedInState) {
                    // This is pop our page, untill our first page not come.
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } else if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.error),
                      duration: Duration(milliseconds: 2000),
                    ));
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ElevatedButton(
                    child: const Text('Verify'),
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context)
                          .verifyOTP(otpValue.text);
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
