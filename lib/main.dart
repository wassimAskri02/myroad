import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proje/Screens/HomeScreens.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:proje/Screens/Login.dart';
import 'package:proje/Screens/dashboard/components/Manage_vehicle.dart';
import 'package:proje/Map.dart';
import 'package:proje/Screens/dashboard/components/Route_history.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MY ROAD',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF212332),
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: Color(0xFF2A2D3E),
        ),
        home: AnimatedSplashScreen(
          splash: "assets/icons/Myway.png",
          duration: 3000,
          splashTransition: SplashTransition.scaleTransition,
          nextScreen: LoginPage(),
          backgroundColor: Color(0xFF2A2D3E),
        ),
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          Map.id: (context) => Map(),
          ManageVehicle.id: (context) => ManageVehicle(),
          RouteHistory.id: (context) => RouteHistory(),
        });
  }
}
