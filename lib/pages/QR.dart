import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class QRCodePage extends StatefulWidget {
  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  var result;

  Future scanQR() async {
    try {
      var scanResult = await BarcodeScanner.scan();
      setState(() {
        result = scanResult;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unkown error";
        });
      }
    } on FormatException catch (e) {
      result = "You pressed de back button before scanning";
    } catch (e) {
      setState(() {
        result = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scan'),

      ),

      body: Center(
        child: Column(



          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Image.asset(
                "assets/images/11.png",
                width: 300.0,
              ),
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child : Align(
                alignment: Alignment.center,
              child: Text(
                ' Please Scan QR Code Of The Area You Want to Access',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.scanner), onPressed: scanQR, label: Text('QR Scan')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}