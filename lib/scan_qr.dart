// ignore_for_file: prefer_const_literals_to_create_immutables, deprecated_member_use, prefer_const_constructors

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({Key? key}) : super(key: key);

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String barcode = "";

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
         ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              // child: RaisedButton(
              //   color: Colors.blue,
              //   textColor: Colors.white,
              //   splashColor: Colors.blueGrey,
              //   onPressed: scan,
              //   child: const Text('Give access to camera'),
              // ),
              child: TextButton(onPressed: scan, child: Center(
                    child: Text(
                    'Give access to camera',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                ),
                  ),
                 style: TextButton.styleFrom(backgroundColor: Colors.grey,
                 ),
                )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                barcode,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future scan() async {
    try {
      await BarcodeScanner.scan().then((value) =>
          setState(() => this.barcode = value.rawContent.toString()));
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant camera permission!';
        });
      } else {
        setState(() {
          this.barcode = 'Unknown error: $e';
        });
      }
    } on FormatException {
      setState(() {
        this.barcode = 'null (User returned using the "back" button before scanning)';
      });
    } catch (e) {
      setState(() {
        this.barcode = 'Unknown error : $e';
      });
    }
  }
}
