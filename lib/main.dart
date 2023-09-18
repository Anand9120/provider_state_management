import 'package:flutter/material.dart';
import 'package:provider_tutorials/provider/auth_provider.dart';
import 'package:provider_tutorials/provider/count_provider.dart';
import 'package:provider_tutorials/provider/example_one_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/provider/favourite_screen_provider.dart';
import 'package:provider_tutorials/provider/theme_changer_provider.dart';
import 'package:provider_tutorials/screen/dark_theme.dart';
import 'package:provider_tutorials/screen/example_one.dart';
import 'package:provider_tutorials/screen/favourite_screen.dart';
import 'package:provider_tutorials/screen/login.dart';
import 'package:provider_tutorials/screen/value_notify_listener.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create:(_)=>CountProvider()),
    ChangeNotifierProvider(
    create:(_)=>ExampleOneProvider()), ChangeNotifierProvider(create:(_)=>FavouriteScreenProvider()),
          ChangeNotifierProvider(create:(_)=>ThemeChanger()),
          ChangeNotifierProvider(create: (context)=>AuthProvider())
    ]
      ,child:Builder(builder:(BuildContext context){
      final themeProvider=Provider.of<ThemeChanger>(context);
        return MaterialApp(
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.light
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark
            ),
            home: const LoginScreen());
    },)
    );
  }
}

