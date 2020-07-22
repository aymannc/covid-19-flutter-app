import 'dart:convert';

import 'package:covid19/panels/NearbyPlaces.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Approximite extends StatefulWidget {
  @override
  _ApproximiteState createState() => _ApproximiteState();
}

class _ApproximiteState extends State<Approximite> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  List<dynamic> nearbyPharmacies;
  List<dynamic> nearbyHopitaux;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Lieux à proximité"),
            bottom: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.local_pharmacy),
                      Text("Pharmacies"),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.local_hospital),
                      Text("Hospitals"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: (nearbyPharmacies != null)
              ? TabBarView(
                  children: <Widget>[
                    NearbyPlaces(
                      nearbyPharmacies,
                    ),
                    NearbyPlaces(
                      nearbyHopitaux,
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                )),
    );
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then((Position position) {
      setState(() {
        this._currentPosition = position;
      });
      _getNearbyPharmacies();
      _getNearbyHopitaux();
    }).catchError((e) {
      print(e);
    });
  }

  _getNearbyPharmacies() async {
    String url =
        "https://api.tomtom.com/search/2/nearbySearch/.json?openingHours=nextSevenDays&key=roMyWvXGFas05cOlnuPcVqTp4veooe0E" +
            "&lat=" +
            _currentPosition.latitude.toString() +
            "&lon=" +
            _currentPosition.longitude.toString() +
            "&categorySet=7326";
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      setState(() {
        nearbyPharmacies = json.decode(utf8.decode(resp.bodyBytes))['results'];
      });
    }
  }

  _getNearbyHopitaux() async {
    String url =
        "https://api.tomtom.com/search/2/nearbySearch/.json?openingHours=nextSevenDays&key=roMyWvXGFas05cOlnuPcVqTp4veooe0E" +
            "&lat=" +
            _currentPosition.latitude.toString() +
            "&lon=" +
            _currentPosition.longitude.toString() +
            "&categorySet=7321";
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      setState(() {
        nearbyHopitaux = json.decode(utf8.decode(resp.bodyBytes))['results'];
      });
    }
  }
}
