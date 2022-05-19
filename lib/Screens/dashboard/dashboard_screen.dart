import 'package:proje/responsive.dart';
import 'package:flutter/material.dart';
import 'package:proje/Map.dart';

import '../../constants.dart';
import 'components/header.dart';

import 'components/Manage_person.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
           Column(
                    children: [
                      Map(),
                  
                    ],
                  ),
                
            
               
              ],
            )
          
        ),
      );
    
  }
}
