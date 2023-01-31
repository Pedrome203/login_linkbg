import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_linkbg/ui/home_screen.dart';
import 'package:login_linkbg/ui/login_screen.dart';
import 'package:login_linkbg/bloc/splash_cubit.dart';
import '../utils/navigator_utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SplashCubit()..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, snapshot) {
          if (snapshot == SplashState.login) {
            pushAndReplaceToPage(context, const LoginScreen());
          } else if (snapshot == SplashState.home) {
            pushAndReplaceToPage(context, const HomeScreen());
          } else {
            pushAndReplaceToPage(context, const LoginScreen());
          }
        },
        child: Scaffold(
          body: Center(
              child: Container(
            child: const Text('cargando...'),
          )),
        ),
      ),
    );
  }
}
