import 'package:flutter/material.dart';

class TypeSelectorBox extends StatelessWidget {

  final String name;
  // final IconData style;

  TypeSelectorBox({@required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.transparent,
                spreadRadius: 4,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 18,
                )
              )
            ],
          )
        ),
      ),
    );
  }
}