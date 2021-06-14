// Packages
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarTile extends StatelessWidget {

  final String name;
  final String price;
  final String mileage;
  final String transactionDate;

  CarTile({ this.name, this.price, this.mileage, this.transactionDate});

  @override
  Widget build(BuildContext context) {

    String formattedDate = DateFormat('dd MMMM yyyy').format(DateTime.parse(transactionDate));

    String formattedPrice = NumberFormat("#,##0.00", "en_US").format(int.parse(price));

    return Container(
      width: 325,
      margin: EdgeInsets.all(5),
      child: Card(
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container (
                    child: Text(
                      name, 
                      overflow: TextOverflow.ellipsis ,
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 16
                      ),
                    )
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container (
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Color(0xFF85bb65),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Text(
                                  "Rp. $formattedPrice", 
                                  overflow: TextOverflow.ellipsis ,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container (
                                padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
                                child: Text(
                                  "Mileage : $mileage", 
                                  overflow: TextOverflow.ellipsis ,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Container (
                                padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
                                child: Text(
                                  "Date : $formattedDate", 
                                  overflow: TextOverflow.ellipsis ,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          width: 100,
                          child: Image.asset('assets/images/image.jpg')
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      )
    );
  }
}