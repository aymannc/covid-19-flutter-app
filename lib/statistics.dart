import 'package:flutter/material.dart';

import 'colors.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(offWhite),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Statistics'),
        ),
      ),
      body: Container(
        child: Center(
          child: Text("Statistics"),
        ),
      ),
    );
  }
}
