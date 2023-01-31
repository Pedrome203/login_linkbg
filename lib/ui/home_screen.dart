import 'package:flutter/material.dart';
import 'package:login_linkbg/ui/login_screen.dart';

import 'package:provider/provider.dart';
import '../bloc/home_provider.dart';
import '../utils/navigator_utils.dart';
import 'common/loader_custom.dart';

import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
          create: (__) => HomeProvider(), child: const Welcome()),
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    bool response;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
        child: Container(
          width: double.infinity,
          height: 100,
          color: Colors.white,
          child: Column(
            children: [
              Text(
                'BIENVENIDO A LINK BG',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 100,
              ),
              MaterialButton(
                onPressed: () async {
                  loaderView(context);

                  response = await homeProvider.logout();
                  if (response) {
                    Loader.hide();
                    pushAndReplaceToPage(context, const LoginScreen());
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Theme.of(context).colorScheme.primary,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: const Text(
                      'Cerrar Sesión',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
