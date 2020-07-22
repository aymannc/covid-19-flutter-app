import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NearbyPlaces extends StatefulWidget {
  final List<dynamic> places;

  const NearbyPlaces(this.places);

  @override
  _NearbyPlacesState createState() => _NearbyPlacesState();
}

class _NearbyPlacesState extends State<NearbyPlaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        //padding: EdgeInsets.all(10),
        itemCount: widget.places.length,
        itemBuilder: (BuildContext context, int index) {
          var place = widget.places[index];
          var f = new NumberFormat("###.0#", "en_US");
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              margin: EdgeInsets.all(15),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place['poi']['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    place['poi']['categories'][0] +
                        ' : ' +
                        f.format(place['dist']) +
                        ' m',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.red[800],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          place['address']['freeformAddress'],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
