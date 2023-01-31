import 'package:flutter/material.dart';
import 'package:login_linkbg/ui/home_screen.dart';
import 'package:login_linkbg/bloc/login_provider.dart';
import '../utils/navigator_utils.dart';
import 'package:provider/provider.dart';

import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

import 'common/loader_custom.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          HeaderContainer(size: size),
          const HeaderIcon(),
          ChangeNotifierProvider(
              create: (__) => LoginFormProvider(), child: const CardForm()),
        ],
      ),
    ));
  }
}

class CardForm extends StatelessWidget {
  const CardForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    bool response;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 200),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 30,
                        offset: Offset(-1, 1))
                  ]),
              child: Column(children: [
                const SizedBox(height: 15),
                Text(
                  'LOGIN',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: loginForm.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: Theme.of(context).textTheme.bodySmall,
                              prefixIcon: const Icon(Icons.email_outlined),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 2),
                              )),
                          onChanged: (value) => loginForm.email = value,
                          validator: (value) {
                            String pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regExp = RegExp(pattern);

                            return regExp.hasMatch(value ?? '') &&
                                    value != null &&
                                    value.isNotEmpty
                                ? null
                                : 'Correo invalido';
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          autocorrect: false,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: Theme.of(context).textTheme.bodySmall,
                              prefixIcon: const Icon(Icons.key_outlined),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 2),
                              )),
                          onChanged: (value) => loginForm.password = value,
                          validator: (value) {
                            return (value != null && value.isNotEmpty)
                                ? null
                                : 'Este campo es obligatorio';
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          onPressed: () async {
                            if (loginForm.isValidForm()) {
                              loaderView(context);
                              response = await loginForm.login();
                              if (response) {
                                Loader.hide();
                                pushAndReplaceToPage(
                                    context, const HomeScreen());
                              } else {
                                Loader.hide();
                                final snackBar = SnackBar(
                                  content: const Text(
                                      'Error en correo o contraseña'),
                                  action: SnackBarAction(
                                    label: 'OK',
                                    onPressed: () {},
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
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
                                'Ingresar',
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderIcon extends StatelessWidget {
  const HeaderIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: const Icon(Icons.person_pin, color: Colors.white, size: 100),
      ),
    );
  }
}

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: size.height * 0.4,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.secondary
        ])));
  }
}
