import 'package:flutter/material.dart';

import 'constants.dart';

Widget flatButton(text, press) => FlatButton(
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(color: buttonColor),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: buttonColor, width: 1.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      minWidth: 200,
      height: 40,
      focusColor: Colors.white,
    );
