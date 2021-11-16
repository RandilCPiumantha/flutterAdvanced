// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
//
// //display a map
// //https://pub.dartlang.org/packages/flutter_map#-installing-tab-
//
// void main() {
//   runApp(new MaterialApp(
//     home: new MyApp(),
//   ));
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _State createState() => new _State();
// }
//
// class _State extends State<MyApp> {
//
//   late MapController mapController;
//   late Map<String, LatLng> coords;
//   late List<Marker> markers;
//
//
//   @override
//   void initState() {
//     mapController = new MapController();
//
//     coords = new Map<String, LatLng>();
//     coords.putIfAbsent("Chicago", () => new LatLng(41.8781, -87.6298));
//     coords.putIfAbsent("Detroit", () => new LatLng(42.3314, -83.0458));
//     coords.putIfAbsent("Lansing", () => new LatLng(42.7325, -84.5555));
//
//     markers = <Marker>[];
//
//     for(int i = 0; i < coords.length; i++) {
//       markers.add(
//           new Marker(
//             width: 80.0,
//             height: 80.0,
//             point: coords.values.elementAt(i),
//             builder: (ctx) => new Icon(Icons.pin_drop, color: Colors.red,),
//           )
//       );
//     }
//   }
//
//   void _showCoord(int index) {
//     mapController.move(coords.values.elementAt(index), 10.0);
//   }
//
//   List<Widget> _makeButtons() {
//     List<Widget> list = [];
//
//     for(int i = 0; i < coords.length; i++) {
//       list.add(new RaisedButton(onPressed: () => _showCoord(i), child: new Text(coords.keys.elementAt(i)),));
//     }
//     return list;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('Name here'),
//       ),
//       body: new Container(
//         padding: new EdgeInsets.all(32.0),
//         child: new Center(
//           child: new Column(
//             children: <Widget>[
//               new Row(children: _makeButtons()),
//               new Flexible(
//                 child: new FlutterMap(
//                   mapController: mapController,
//                   options: new MapOptions(
//                     center: new LatLng(41.8781, -87.6298),
//                     zoom: 5.0,
//                   ),
//                   layers: [
//                     new TileLayerOptions(
//                         urlTemplate:
//                         "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                         subdomains: ['a', 'b', 'c']),
//                     new MarkerLayerOptions(markers: markers),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

//display a map
//https://pub.dartlang.org/packages/flutter_map#-installing-tab-

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  late List<LatLng> points;
  late MapController mapController;
  late List<Marker> markers;


  @override
  void initState() {
    super.initState();

    mapController = new MapController();
    points = <LatLng>[];
    points.add(new LatLng(41.8781, -87.6298));
    points.add(new LatLng(42.3314, -83.0458));
    points.add(new LatLng(42.7325, -84.5555));

    markers = <Marker>[];
    for(int i = 0; i < points.length; i++) {
      markers.add(new Marker(
        width: 80.0,
        height: 80.0,
        point: points.elementAt(i),
        builder: (ctx) => new Icon(Icons.pin_drop,color: Colors.red,),
      ));
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Flexible(
                child: new FlutterMap(
                  mapController: mapController,
                  options: new MapOptions(
                    center: new LatLng(41.8781, -87.6298),
                    zoom: 5.0,
                  ),
                  layers: [
                    new TileLayerOptions(
                        urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c']),
                    new MarkerLayerOptions(markers: markers),
                    new PolylineLayerOptions(
                        polylines: [
                          new Polyline(
                              points: points,
                              strokeWidth: 4.0,
                              color: Colors.purple
                          )
                        ]
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}