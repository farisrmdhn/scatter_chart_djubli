// Packages
import 'package:flutter/material.dart';

class MpvPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Toyota Innova 2.5V',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )
          ),
          Text(
            '2015',
            style: TextStyle(
              fontSize: 16
            ),
          ),
        ],
      ),
    );
  }
}