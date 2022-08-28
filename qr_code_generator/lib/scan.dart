import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_generator/generate.dart';
import 'package:qr_code_generator/widgets.dart';
import 'constants.dart';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String qrResult = "Not yet Scanned";

  pressScan() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Scan()));
  }

  pressGenerate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Generate()));
  }

  scanFunc() async {
    var scaning = await BarcodeScanner.scan();
    setState(() {
      qrResult = scaning.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan"),
        centerTitle: true,
        backgroundColor: secColor,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: mainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "RESULT",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              qrResult,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            flatButton("Scan QR Code", scanFunc),
          ],
        ),
      ),
    );
  }
}
