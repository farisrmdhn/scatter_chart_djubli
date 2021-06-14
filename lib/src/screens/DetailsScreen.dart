// Packages
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

// Models

import '../models/Car.dart';
import '../models/Cars.dart';

class DetailsScreen extends StatelessWidget {

  final String id;

  DetailsScreen({this.id});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery. of(context). size. width;

    Car car = cars.lastWhere((element) => element.id == this.id, orElse: () => null);

    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          height: 50,
          width:MediaQuery.of(context).size.width * 90 / 100,
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(25)
          ),
          child: Center(
            child: Text(
              "Back",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),
            ),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Material(
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Icon(
                  Icons.menu,
                  color: Color(0xFFFF5A5F),
                ),

                Container(
                  child: Text(
                    "djubli",
                    style: TextStyle(
                      fontSize: 36,
                      color: Color(0xFFFF5A5F)
                    ),
                  )
                ),

                Stack(
                  children: <Widget>[
                    Icon(
                      Icons.notifications_none,
                      color: Colors.grey[400],
                    ),
                    Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: Icon(
                        Icons.brightness_1, 
                        size: 8.0, 
                        color: Color(0xFFFF5A5F),
                      ),
                    ),
                  ]
                ),

              ],
            ),
          ),
        ),
      ),

      body: _buildBody(car, width),
    );
  }

  Widget _buildBody(Car car, double width) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              car.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            ),
            SizedBox(height: 3.5),
            Container (
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.yellow[700],
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                car.id, 
                overflow: TextOverflow.ellipsis ,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(child: Image.asset('assets/images/image.jpg', height: 225,)),
            SizedBox(height: 10),
            _cardBuilder(car, width),
            SizedBox(height: 65,),
          ],
        ),
      ),
    );
  }

  Widget _cardBuilder(Car car, double width) {

    
    String formattedPrice = NumberFormat("#,##0.00", "en_US").format(car.price);
    String formattedDate = DateFormat('dd MMMM yyyy').format(DateTime.parse(car.transactionDate));
    String color = car.color;
    String mileage = car.mileage;
    String location = car.location;

    return Container(
      width: width,
      child: Card(
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container (
                child: Text(
                  "Harga: Rp. $formattedPrice", 
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 18
                  ),
                )
              ),
              SizedBox(height: 10,),
              Container(
                child: Text(
                  "Deskripsi: ", 
                  style: TextStyle( 
                    fontSize: 16
                  ),
                )
              ),
              SizedBox(height: 5,),
              Container(
                width: width*0.8,
                child: Text(
                  car.desc,
                  textAlign: TextAlign.justify, 
                  overflow: TextOverflow.visible,
                  style: TextStyle( 
                    fontSize: 14
                  ),
                )
              ),
              SizedBox(height: 10,),
              Container(
                width: width*0.8,
                child: Text(
                  "Warna: $color",
                  textAlign: TextAlign.justify, 
                  overflow: TextOverflow.visible,
                  style: TextStyle( 
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 2.5,),
              Container(
                width: width*0.8,
                child: Text(
                  "Km: $mileage",
                  textAlign: TextAlign.justify, 
                  overflow: TextOverflow.visible,
                  style: TextStyle( 
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 2.5,),
              Container(
                width: width*0.8,
                child: Text(
                  "Lokasi: $location",
                  textAlign: TextAlign.justify, 
                  overflow: TextOverflow.visible,
                  style: TextStyle( 
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: width*0.8,
                child: Text(
                  "Terjual pada tanggal $formattedDate",
                  textAlign: TextAlign.justify, 
                  overflow: TextOverflow.visible,
                  style: TextStyle( 
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
            ],
          ),
        )
      ),
    );
  }
}