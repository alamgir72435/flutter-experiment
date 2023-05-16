import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/infinite_scroll.dart';
import 'package:myapp/pages/login_page.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:myapp/pages/map_screen.dart';
import 'package:myapp/utils/routes.dart';
import 'package:myapp/widgets/Theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: MyTheme.darkTheme(context),
      theme: MyTheme.lightTheme(context),

      routes: {
        MyRoutes.InitialRoute: (context) => InfiniteScrl(),
        // MyRoutes.HomeRoute: (context) => HomePage(),
        // MyRoutes.LoginRoute: (context) => LoginPage()
        //
      },
    );
  }
}
