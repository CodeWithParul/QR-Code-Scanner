// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
//import 'dart:ui';

import 'package:qr_code_scanner/generate_qr.dart';
import 'package:qr_code_scanner/scan_qr.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OR Code Scanner',
      home: CodeScanner(),
    );
  }
}

class CodeScanner extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Center(child: Text('Code Scanner'),),),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: const [Color.fromARGB(255, 149, 206, 206), Colors.blueGrey],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(55),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScanQR(),
                    ),
                  );
                },
                child: Expanded(
                  child:TextButton(onPressed: null, child: Center(
                    child: Text(
                    'SCAN \n QR-CODE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      wordSpacing: 15,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                ),
                  ),
                //  style: TextButton.styleFrom(backgroundColor: Colors.grey,
                //  ),
                ),),
              ),
              SizedBox(
                height: 100.0,              ),
               GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenerateQR(),
                    ),
                  );
                },
                 child: Expanded(
                  child:TextButton(onPressed: null, child: Center(
                    child: Text(
                    'GENERATE \n QR-CODE',
                    textAlign: TextAlign.center,
                       style: TextStyle(
                      wordSpacing: 15,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                             ),
                  ),
                             // style: TextButton.styleFrom(backgroundColor: Colors.grey),
                             ),
                             ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}

//  child: Column(
          
        //    mainAxisAlignment: MainAxisAlignment.center,
           
        //   children: [
            
        //   ],
         //  ),
