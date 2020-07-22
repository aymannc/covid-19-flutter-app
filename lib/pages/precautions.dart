

import 'package:flutter/material.dart';

import '../data/colors.dart';


class PrecautionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(white),
      appBar: AppBar(
        title: Text('Daily Precautions'),
      ),
      body: ListView(

        children: <Widget>[
      DrawerHeader(
      child: Center(
        child: Text(
          "Let's Fight Together Against Covid-19",
        style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
        ),
      ),
    ),
    ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            child: Row(

              children: <Widget>[

                Image.asset(
                    "assets/images/1.jpg",
                     width: 100.0,
                ),
                Text(
                  '   Wash your hands regularly or \n   use a hydro-alcoholic gel',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            child: Row(

              children: <Widget>[

                Image.asset(
                  "assets/images/2.jpg",
                  width: 100.0,
                ),
                Text(
                  '   Avoid touching your face',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            child: Row(

              children: <Widget>[

                Image.asset(
                  "assets/images/3.jpg",
                  width: 100.0,
                ),
                Text(

                  '   Cough or sneeze into your \n   elbow or handkerchief',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            child: Row(

              children: <Widget>[

                Image.asset(
                  "assets/images/4.jpg",
                  width: 100.0,
                ),
                Text(

                  '   Maintain a distance of at \n   least one meter from others',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            child: Row(

              children: <Widget>[

                Image.asset(
                  "assets/images/5.jpg",
                  width: 100.0,
                ),
                Text(

                  '   Blow your nose in a disposable\n   tissue and throw it away',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            child: Row(

              children: <Widget>[

                Image.asset(
                  "assets/images/6.jpg",
                  width: 100.0,
                ),
                Text(

                  '   Greet without shaking hands \n   and stop kissing',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),


        ],



          ),
    );
  }
}





