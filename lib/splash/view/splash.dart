import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/dashboard/view/dashboard.dart';
import 'package:food/login/view/login.dart';
import 'package:food/sharedpref/view/sharedpref.dart';
import 'package:food/splash/bloc/splash_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final _splashbloc = SplashBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _splashbloc..add(NavigateToLoginEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is NavigateLoginState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ));
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Dashboard(),
                ));
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSplashScreen(
                  duration: 300000,
                  splash: Lottie.network(
                    fit: BoxFit.contain,
                    'https://assets4.lottiefiles.com/packages/lf20_snmohqxj/lottie_step2/data.json',
                  ),
                  nextScreen: const Login(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
