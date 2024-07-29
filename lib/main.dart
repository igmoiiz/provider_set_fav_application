import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_set_fav_application/Dashboard/interface.dart';
import 'package:provider_set_fav_application/Provider/provider.dart';
import 'package:provider_set_fav_application/Provider/theme_changer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return Flexify(
            designHeight: 812,
            designWidth: 375,
            app: MaterialApp(
              themeMode: themeChanger.themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.green,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
              ),
              home: const InterfacePage(),
            ),
          );
        },
      ),
    );
  }
}
