import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_changer_provider.dart';
class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {

  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Themes '),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(title: Text('Light Mode'),
              value: ThemeMode.light, groupValue: themeProvider.themeMode, onChanged: themeProvider.setTheme),
          RadioListTile<ThemeMode>(title: Text('Dark Mode'),
              value: ThemeMode.dark, groupValue: themeProvider.themeMode, onChanged: themeProvider.setTheme)
          ,  RadioListTile<ThemeMode>(title: Text('System Mode'),
              value: ThemeMode.system, groupValue: themeProvider.themeMode, onChanged: themeProvider.setTheme)
        ],
      )
    );
  }
}
