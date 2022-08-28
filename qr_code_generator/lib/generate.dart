import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_generator/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'constants.dart';

class Generate extends StatefulWidget {
  const Generate({Key? key}) : super(key: key);

  @override
  State<Generate> createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  String qrData = "";

  TextEditingController qrText = TextEditingController();

  genFunc() {
    if (qrText.text.isEmpty) {
      setState(() {
        qrData = "https://flutter.dev";
      });
    } else {
      setState(() {
        qrData = qrText.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Generate"),
          centerTitle: true,
          backgroundColor: secColor,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImage(
                  data: qrData,
                  size: 300,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Get your data/link to the QR Code",
                  style: TextStyle(color: buttonColor),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: qrText,
                  decoration: InputDecoration(
                    hintText: "Enter the data/link",
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: buttonColor),
                        borderRadius: BorderRadius.all(Radius.circular(60))),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      borderSide: const BorderSide(color: secColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                flatButton("GENERATE QR CODE", genFunc)
              ],
            ),
          ),
        ));
  }
}
