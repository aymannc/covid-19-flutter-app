import 'colors.dart';
import 'package:flutter/material.dart';

import 'statistics.dart';

class MyMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(black),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text(
                  "BeSafe: COVID-19 app",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              leading: Icon(
                Icons.pie_chart,
                color: Colors.white,
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
              title: Text(
                "Statistics",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Statistics()));
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
