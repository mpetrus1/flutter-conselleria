import 'package:flutter/material.dart';
import 'package:projecte_final/providers/movies_provider.dart';
import 'package:projecte_final/providers/theme_provider.dart';
import 'package:projecte_final/providers/weather_provider.dart';
import 'package:projecte_final/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(
    child: AppState(),
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode),
      ),
      
    ],
    ),
    );
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => WeatherProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projecte final curs Flutter',
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      routes: {
        '/': (context) => const HomeScreen(),
        '/weather': (context) => const WeatherScreen(),
        '/movies': (context) => MoviesHome(),
        '/moviedetails': (context) => MovieDetails(),
        '/settings': (context) => SettingsScreen(),
      },
      initialRoute: '/',

      //home: HomeScreen(),
    );
  }
}
