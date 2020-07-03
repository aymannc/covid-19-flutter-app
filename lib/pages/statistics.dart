import 'dart:convert';

import 'package:covid19/panels/moroccanStats.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  Map moroccoData;

  fetchMoroccoData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries/morocco');
    setState(() {
      moroccoData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchMoroccoData();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Statistics',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  this.moroccoData == null
                      ? Text('')
                      : Image.network(
                          moroccoData['countryInfo']['flag'],
                          height: 25,
                        ),
                  SizedBox(width: 20),
                  Text(
                    'Morocco',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            moroccoData == null
                ? Text('Loading ..!')
                : MoroccoCasesPanel(
                    moroccoData: moroccoData,
                  ),
            SizedBox(
              height: 50,
            )
          ],
        )),
      ),
    );
  }
}
