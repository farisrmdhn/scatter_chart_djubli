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
    DateTime date = DateTime.parse(transactionDate);
    String formattedDate = DateFormat('dd MMMM yyyy').format(date);
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
                  SizedBox(height: 5),
                  Container (
                    padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(
                      "Rp. $price", 
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
            ],
          ),
        )
      )
    );
  }

  MaterialColor colorPicker(wLevel) {
    if(wLevel == 'SAFE') {
      return Colors.green;
    } else if(wLevel == 'WARNING') {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  AssetImage setImage(weather, timestamp) {
    var day = 'day';

    if(timestamp != "No Data") {
      DateTime datetime = DateTime.parse(timestamp);
      if(datetime.hour < 6 || datetime.hour >= 18) {
        day = 'night';
      }
    }

    if(weather == 'Clear'){
      return AssetImage('assets/images/weather/clear_$day.png');
    } else if(weather == 'Clouds') {
      return AssetImage('assets/images/weather/cloudy_$day.png');
    } else if(weather == 'Rain') {
      return AssetImage('assets/images/weather/rainy_$day.png');
    } else if(weather == 'Haze') {
      return AssetImage('assets/images/weather/haze_$day.png');
    } else {
      return AssetImage('assets/images/weather/storm_$day.png');
    }
  }

}