// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:proje/Screens/Login.dart';
import 'package:proje/Screens/dashboard/components/Manage_person.dart';
import 'package:proje/Screens/dashboard/components/Manage_vehicle.dart';
import 'package:proje/Screens/dashboard/components/header.dart';
import 'package:proje/constants.dart';
import 'package:provider/provider.dart';
import 'package:proje/Map.dart';
import '../controllers/MenuController.dart';
import 'dashboard/components/Route_history.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home-screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _selectedScreen = Map();

  currentScreen(item) {
    switch (item.route) {
      case Map.id:
        setState(() {
          _selectedScreen = Padding(
            padding: const EdgeInsets.all(8.0),
            child: Map(),
          );
        });
        break;
      case ManagePerson.id:
        setState(() {
          _selectedScreen = Padding(
            padding: const EdgeInsets.all(8.0),
            child: ManagePerson(),
          );
        });
        break;
      case ManageVehicle.id:
        setState(() {
          _selectedScreen = Padding(
            padding: const EdgeInsets.all(12.0),
            child: ManageVehicle(),
          );
        });
        break;
      case RouteHistory.id:
        setState(() {
          _selectedScreen = Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Container(alignment: Alignment.topLeft, child: RouteHistory()),
          );
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Color(0xFF212332),
      sideBar: SideBar(
        backgroundColor: Color(0xFF2A2D3E),
        borderColor: Color(0xFF2A2D3E),
        textStyle: TextStyle(color: Colors.white54),
        items: [
          AdminMenuItem(
            title: 'Map',
            route: Map.id,
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'Manage Person',
            route: ManagePerson.id,
            icon: Icons.person,
          ),
          AdminMenuItem(
            title: 'Manage Vehicle',
            route: ManageVehicle.id,
            icon: Icons.directions_car,
          ),
          AdminMenuItem(
            title: 'Route History',
            route: RouteHistory.id,
            icon: Icons.history,
          ),
        ],
        selectedRoute: HomeScreen.id,
        onSelected: (item) {
          currentScreen(item);
        },
        header: Container(
          height: 200,
          width: double.infinity,
          color: const Color(0xFF2A2D3E),
          child: Center(
              child: Container(
                  width: 90,
                  height: 90,
                  child: Image.asset(
                    "assets/icons/Myway.png",
                  ))),
        ),
      ),
      body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => MenuController(),
            ),
          ],
          child: Container(
            margin: EdgeInsets.all(9),
            child: Column(
              children: [
                Header(),
                SizedBox(height: defaultPadding),
                Column(
                  children: [
                    _selectedScreen,
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
