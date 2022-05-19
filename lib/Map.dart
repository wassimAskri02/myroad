import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';
import 'scale_layer_plugin_option.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

/*class NetworkHelper {
  NetworkHelper(
      {this.startLng,
  this.startLat,
     this.endLng,
      this.endLat});

  final String url = 'https://api.openrouteservice.org/v2/directions/';
  final String apiKey =
      '5b3ce3597851110001cf624879e68fb72096416e9936a37b3ece4165';
  final String journeyMode =
      'driving-car'; // Change it if you want or make it variable
  final double startLng;
  final double startLat;
  final double endLng;
  final double endLat;

  final double endLng;
  final double endLat;

  final double endLng;
  final double endLat;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(
        '$url$journeyMode?api_key=$apiKey&start=$startLng,$startLat&end=$endLng,$endLat'));
    print(
        "$url$journeyMode?$apiKey&start=$startLng,$startLat&end=$endLng,$endLat");

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
*/
class Map extends StatefulWidget {
  static const String id = 'map';

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {


  List<bool> isSelected =[true,false];
    List<LatLng> tappedPoints = [];
   MapController _mapController ;   
  final PopupController _popupController = PopupController();


  List<Marker> markers;
  int pointIndex;
 List points = [
   LatLng(51.5 ,-0.09),
   LatLng(49.8566, 3.3522),
 ];

 @override
 void initState(){
   
   _mapController = MapController();

 

  super.initState();
 }
 
  @override
  Widget build(BuildContext context) {
     var markers = tappedPoints.map((latlng) {
      return Marker(
        width: 80.0,
        height: 80.0,
        point: latlng,
        builder: (ctx) => Container(
          child: Icon(Icons.location_on,color: Color.fromARGB(255, 210, 25, 25)),
        ),
      );
    }).toList();
   

/*
    final List<LatLng> polyPoints = []; // For holding Co-ordinates as LatLng
    final Set<Polyline> polyLines = {}; // For holding instance of Polyline
    // For holding instance of Marker
    var data;
    // Dummy Start and Destination Points
    double startLat = 44.837789;
    double startLng = -0.57918;
    double endLat = 41.902784;
    double endLng = 12.496366;

    var points = <LatLng>[];

    var pointsGradient = <LatLng>[
      LatLng(startLat, startLng),
      LatLng(endLat, endLng),
    ];

    void getJsonData() async {
      // Create an instance of Class NetworkHelper which uses http package
      // for requesting data to the server and receiving response as JSON format

      NetworkHelper network = NetworkHelper(
        startLat: startLat,
        startLng: startLng,
        endLat: endLat,
        endLng: endLng,
      );

      try {
        // getData() returns a json Decoded data
        data = await network.getData();

        // We can reach to our desired JSON data manually as following
        LineString ls =
            LineString(data['features'][0]['geometry']['coordinates']);

        for (int i = 0; i < ls.lineString.length; i++) {
          polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
        }

        if (polyPoints.length == ls.lineString.length) {
          print(ls);
          //print(polyPoints);
        }
      } catch (e) {
        print(e);
        //print(polyPoints);
      }
    }

    getJsonData();
    print(polyPoints);*/
   return Container(
   height: 560,
   alignment: Alignment.centerLeft,
   child: Center(
     child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
              child: FlutterMap(
                mapController: _mapController,   
                options: MapOptions(
                 center: LatLng(36.788932, 10.082826),
            zoom: 10,
            onTap: _handleTap,
             plugins: [
              ScaleLayerPlugin(),
              MarkerClusterPlugin(),
              
            ],
                ),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c']),
                        MarkerClusterLayerOptions(
                 
                 maxClusterRadius: 120,
                 disableClusteringAtZoom: 6,
                 size: Size(40,40),
                 anchor: AnchorPos.align(AnchorAlign.center),
                 fitBoundsOptions: FitBoundsOptions(
                   padding: EdgeInsets.all(50),
                 ),
                 markers: markers,
                 polygonOptions: PolygonOptions(
                   borderColor:Colors.blueAccent,
                   color: Colors.black12,
                   borderStrokeWidth: 3), 
                   popupOptions: PopupOptions(
                     popupSnap: PopupSnap.markerTop,
                     popupController: _popupController,
                     popupBuilder: (_, marker) => Container(
                       width: 300,
                       height: 200,
                       color: Colors.white,
                         child: GestureDetector(
                         onTap: () => debugPrint("Popup tap!"),
                         child: Text(
                         "Container popup for marker at ${marker.point} ,",style: TextStyle(
                  
                  color: Color.fromARGB(255, 29, 28, 28),
                  fontSize: 15.0),
             
                         )
                      )
                        ) 
                     
                     ,),
                 
                 ),
                 
             /*   PolylineLayerOptions(
                    polylines: [
                      Polyline(
                        
                        
                        isDotted: true,
                          points: polyPoints,
                          strokeWidth: 4.0,
                          color: Color.fromARGB(255, 0, 98, 255)),
                    ],
                  ),*/
                ],
                nonRotatedLayers: [
                  ScaleLayerPluginOption(
                    lineColor: Colors.blue,
                    lineWidth: 2,
                    textStyle: TextStyle(color: Colors.blue, fontSize: 12),
                    padding: EdgeInsets.all(10),
                  ),
                ],
              ),
            )));
        
      
    
  }
  void _handleTap(TapPosition tapPosition, LatLng latlng) {
    setState(() {
      tappedPoints.add(latlng);
    });
  }
}
//Create a new class to hold the Co-ordinates we've received from the response data

/*class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}*/