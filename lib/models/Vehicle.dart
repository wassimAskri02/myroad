import 'package:proje/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String registration_number, model;

  final Color color;

  CloudStorageInfo({
    this.registration_number,
    this.model,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    model: "Kia Rio",
    registration_number: '215 TUN 2398',
    color: Color(0xFFFFA113),
  ),
  CloudStorageInfo(
  model: "ISUZU DMAX",
    registration_number: '198 TUN 4558',
    color: Color(0xFFFFA113),
  ),
  CloudStorageInfo(
   model: "peugeot Partner",
    registration_number: '137 TUN 1158',
    color: Color(0xFFFFA113),
  ),
  CloudStorageInfo(
   model: "Polo 7",
    registration_number: '203 TUN 7747',
    color: Color(0xFFFFA113),
  ),

    
];
