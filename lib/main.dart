import 'package:flutter/material.dart';
import 'Screens/quoteScreen/quoteScreen.dart';
import 'Screens/splashcreen.dart';
import 'Screens/theme/themeScreen.dart';

void main()
{
  runApp(QuoteApp());
}

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/to',
      routes: {
        '/' : (context) => const SplashScreen(),
        '/quote' : (context) => const QuoteScreen(),
        '/theme' : (context) => const ThemeScreen(),
        // '/to' : (context) => const TopicScreen(),
      },
    );
  }
}
