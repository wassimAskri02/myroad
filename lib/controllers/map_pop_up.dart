import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:proje/constants.dart';
import 'package:proje/controllers/delete_vehicle.dart';
import 'package:proje/responsive.dart';
import 'styles.dart';
import 'custom_rect_tween copy 2.dart';
import 'hero_dialog_route copy 2.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapPopUp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
         onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return  _AddTodoPopupCard();
          }));
        },
        child: Hero(
          tag: _hroAddTodo,
       
            child:   Icon(Icons.add_location_alt_outlined, color: Colors.white54)
        ),
      
    );
  }
}

class NetworkHelper {
  NetworkHelper(
      {this.startLng,
  this.startLat,
     this.endLng,
      this.endLat});

  final String url = 'https://api.openrouteservice.org/v2/directions/';
  final String apiKey =
      '5b3ce3597851110001cf624879e68fb72096416e9936a37b3ece4165';
  final String journeyMode =
      'foot-walking'; // Change it if you want or make it variable
  final double startLng;
  final double startLat;
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
const String _hroAddTodo = 'add-todo-heo';


class _AddTodoPopupCard extends StatelessWidget {

   _AddTodoPopupCard({Key key}) : super(key: key);
  var markers = <Marker>[
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(36.793213, 10.075898),
        builder: (ctx) => Container(
          child:  Icon(Icons.location_on,color: Color.fromARGB(255, 210, 25, 25)),
        ),
      ),
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(36.770949, 10.213442),
        builder: (ctx) => Container(
          child:  Icon(Icons.location_on,color: Color.fromARGB(255, 210, 25, 25)),
        ),
      ),
  
    ];
  @override
  Widget build(BuildContext context) {
    final List<LatLng> polyPoints = []; // For holding Co-ordinates as LatLng
    // For holding instance of Marker
    var data;
    // Dummy Start and Destination Points
    double startLat = 36.793213;
    double startLng = 10.075898;
    double endLat = 36.770949;
    double endLng = 10.213442;



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
    print(polyPoints);
    


   return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
              decoration: BoxDecoration(
         
          borderRadius: const BorderRadius.all(Radius.circular(30)),),
            width: 800,
            height: 500,
            child: Hero(
              
              tag: _hroAddTodo,
              createRectTween: (begin, end) {
                return CustomRectTweens(begin: end, end: end);
              },
              child:Stack(
  children: <Widget>[ 
    Container(

        height: 570,
   alignment: Alignment.centerLeft,
   child: Center(
       child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
          child : 
               FlutterMap(
      options: MapOptions(
        center: LatLng(36.788932, 10.082826),
        zoom: 13.0,
     ),
          
      layers: [

        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
     
        ),
         PolylineLayerOptions(
                      polylines: [
                        Polyline(
                          
                          
                          isDotted: true,
                            points: polyPoints,
                            strokeWidth: 4.0,
                            color: Color.fromARGB(255, 0, 98, 255)),
                      ],
                    ),
           MarkerLayerOptions(markers: markers)
          
      ],
     
             
  ),
  
              ),
              
            ),
            
          ),
   
    ]  ),
      ))),
  
   ));

 
 
  }
}
class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}