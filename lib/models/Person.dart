import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentFile {
  final String  name, cin, number;
  final Icon delete;
  RecentFile({ this.name, this.cin, this.number,this.delete});
}

List demoRecentFiles = [
  RecentFile(
   delete: Icon(
              Icons.delete,),
    name: "Ahmed trabelsi",
    cin: "09526647",
    number: "55478147",
  ),
  RecentFile(
    delete: Icon(
              Icons.delete,),
    name: "Oussema jemai",
    cin: "00587441",
    number: "28774158",
  ),
  RecentFile(
   delete: Icon(
              Icons.delete,),
    name: "Oumayma mejri",
    cin: "09526992",
    number: "22875441",
  ),
  RecentFile(
   delete: Icon(
              Icons.delete,),
    name: "Wiem bjeoui",
    cin: "12478859",
    number: "99281596",
  ),
  RecentFile(
   delete: Icon(
              Icons.delete,),
    name: "Wassim mejri",
    cin: "05874123",
    number: "50730037",
  ),
  RecentFile(
   delete: Icon(
              Icons.delete,),
    name: "Ali trabelsi",
    cin: "09587741",
    number: "95478996",
  ),

];
