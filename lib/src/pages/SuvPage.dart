// Packages
import 'package:flutter/material.dart';

class SuvPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25),
      child: Center(
        child: 
          Text(
            "Sorry, this car type does not contain any entry.", 
            style: TextStyle(
              fontSize: 22, 
              color: Colors.grey[600]
            ),
            textAlign: TextAlign.center,
          )
        )
      );
  }
}