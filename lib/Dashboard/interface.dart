import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_set_fav_application/Theme%20Modes/dark_theme_screen.dart';
import 'package:provider_set_fav_application/Dashboard/favorite_list.dart';
import 'package:provider_set_fav_application/Provider/provider.dart';

class InterfacePage extends StatefulWidget {
  const InterfacePage({super.key});

  @override
  State<InterfacePage> createState() => _InterfacePageState();
}

class _InterfacePageState extends State<InterfacePage> {
  @override
  Widget build(BuildContext context) {
    // final favProvider = Provider.of<FavProvider>(context);
    // ignore: avoid_print
    print('Whole widget built');
    return Scaffold(
      // backgroundColor: Colors.grey.shade100,
      //app bar
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 10.0,
        automaticallyImplyLeading: false,
        title: Text(
          'Set Favorites',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontFamily: GoogleFonts.montserrat().fontFamily,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Flexify.go(
                const FavoriteList(),
                animation: FlexifyRouteAnimations.fade,
                animationDuration: const Duration(milliseconds: 500),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Flexify.go(
                const DarkThemeScreen(),
                animation: FlexifyRouteAnimations.fade,
                animationDuration: const Duration(milliseconds: 500),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),

      //body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 101,
              itemBuilder: (context, index) {
                return Consumer<FavProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text(
                        'Item $index',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                        ),
                      ),
                      trailing: Icon(
                        value.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                      ),
                      leading: Text(
                        '$index. ',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
