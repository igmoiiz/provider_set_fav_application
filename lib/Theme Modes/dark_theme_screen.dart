import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_set_fav_application/Dashboard/interface.dart';
import 'package:provider_set_fav_application/Provider/theme_changer.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      // backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Flexify.goRemove(
                        const InterfacePage(),
                        animation: FlexifyRouteAnimations.fade,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.green,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.abc,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            const Center(
              child: Text(
                'Switch Between Themes',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  decorationColor: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 50),
            //main functioning
            RadioListTile<ThemeMode>(
              title: const Text(
                'Light Mode',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme,
              activeColor: Colors.green,
            ),
            RadioListTile<ThemeMode>(
              title: const Text(
                'Dark Mode',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme,
              activeColor: Colors.green,
            ),
            RadioListTile<ThemeMode>(
              title: const Text(
                'System Default Mode',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme,
              activeColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
