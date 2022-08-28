import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_generator/generate.dart';
import 'package:qr_code_generator/scan.dart';
import 'package:qr_code_generator/widgets.dart';
import 'constants.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  pressScan() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Scan()));
  }

  pressGenerate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Generate()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secColor,
        title: Text("QRCode"),
        centerTitle: true,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: mainColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/qr_image.png",
                scale: 3,
              ),
              flatButton("Scan QR Code", pressScan),
              flatButton("Generate QR Code", pressGenerate),
            ],
          )),
    );
  }
}
