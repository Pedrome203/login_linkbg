import 'package:flutter/material.dart';
import 'package:login_linkbg/ui/splash_screen.dart';
import 'package:flutter/src/material/text_theme.dart' as texttheme;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const SplashScreen(),
      theme: ThemeData(
          colorScheme: const ColorScheme(
              primary: Color.fromARGB(255, 3, 50, 108),
              primaryContainer: Color.fromARGB(255, 168, 197, 208),
              secondary: Color.fromARGB(129, 3, 50, 108),
              secondaryContainer: Color.fromARGB(255, 255, 255, 255),
              surface: Color(0xFFFFFEFB),
              background: Color.fromARGB(255, 255, 255, 255),
              error: Color.fromARGB(255, 81, 24, 24),
              onPrimary: Color.fromARGB(255, 219, 220, 221),
              onSecondary: Color.fromARGB(255, 155, 149, 149),
              onSurface: Color.fromARGB(255, 59, 58, 58),
              onBackground: Color(0x3A7B7474),
              onError: Color(0xFF5F872C),
              brightness: Brightness.light),
          textTheme: texttheme.TextTheme(
            bodyLarge: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 104, 104, 104),
            ),
            bodyMedium: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold),
            bodySmall: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 116, 116, 116),
            ),
            headlineLarge: TextStyle(
                fontSize: 35,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w800),
            headlineMedium: const TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 65, 65, 65),
                fontWeight: FontWeight.w800),
            headlineSmall: const TextStyle(
                color: Color.fromARGB(255, 82, 79, 79),
                fontWeight: FontWeight.w400,
                fontSize: 18),
          )),
    );
  }
}
