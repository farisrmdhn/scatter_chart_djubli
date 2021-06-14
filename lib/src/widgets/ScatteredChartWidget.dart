import 'dart:async';
import 'dart:convert';


// Packages
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:indexed_list_view/indexed_list_view.dart';

// Models
import '../models/Car.dart';
import '../models/Cars.dart';

// External Widgets
import '../widgets/CarTile.dart';

// Screens
import '../screens/DetailsScreen.dart';

class ScatteredChartWidget extends StatefulWidget {

  @override
  _ScatteredChartWidgetState createState() => _ScatteredChartWidgetState();

}

class _ScatteredChartWidgetState extends State<ScatteredChartWidget> {

  List<Map<dynamic, dynamic>> _data1 = [{ 'name': 'Please wait', 'value': 0 }];
  
  List<Car> carlist = cars;

  String index;

  getData1() async {
    await Future.delayed(Duration(seconds: 4));

    var dataObj = <Map>[];
    carlist.forEach((car) {
      var map = {};
      map['date'] = car.transactionDate;
      map['price'] = (car.price / 1000000).toString();
      dataObj.add(map);
    });
    
    this.setState(() { this._data1 = dataObj;});
  }

   @override
  void initState() {
    super.initState();

    this.getData1();

    this.index = "none";
  }


  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: 450,
            height: 210,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Echarts(
              option:
              '''
                {
                  dataset: {
                    dimensions: ['date', 'price'],
                    source: ${jsonEncode(_data1)},
                  },
                  xAxis: {
                    type: 'time',
                    name: 'Tanggal Transaksi',
                    nameLocation : 'middle',
                    nameGap: 30
                  },
                  yAxis: {
                    type: 'value',
                    name: 'Harga',
                    nameLocation : 'middle',
                    nameGap: 30
                  },
                  series: [{
                      symbolSize: 15,
                      type: 'scatter',
                      itemStyle: {
                          color: ['#ff4081'],
                          shadowColor: 'rgba(0, 0, 0, 0.5)',
                          shadowBlur: 3
                      },
                      selectedMode: true,
                      select: {
                        itemStyle: {
                          color: '#ebc634',
                          shadowColor: 'rgba(0, 0, 0, 0.5)',
                          shadowBlur: 3,
                          borderWidth: 0,
                        },  
                      },
                  }]
              }
              ''',
              extraScript:
              '''
                chart.on('click', (params) => {
                  if(params.componentType === 'series') {
                      Messager.postMessage(params.dataIndex);
                  }
                });
              ''',
              onMessage: (String message) {
                setState(() {
                  index = message;
                });
              },
            ),
          ),
          Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if(int.parse(index) != 1) {
                        index = (int.parse(index) - 1).toString();
                      }
                    });
                  },
                  child: Icon(Icons.arrow_left_rounded, size: 32,)
                ),
                Expanded(
                  child: _listBuilder(index, carlist)
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if(int.parse(index) < cars.length - 1) {
                        index = (int.parse(index) + 1).toString();
                      }
                    });
                  },
                  child: Icon(Icons.arrow_right_rounded, size: 32,)
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
  

  Widget _listBuilder(String input, List<Car> cars) {
    int index ;
    var controller = IndexedScrollController();
    if(input != 'none') {
      index = int.parse(input);
      controller.jumpToIndex(index);
    } else {
      index = 1;
    }
    
    return Container(
      height: 150,
      child: IndexedListView.builder(
        scrollDirection: Axis.horizontal,
        controller: controller,
        minItemCount: 0,
        maxItemCount: cars.length - 1,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(id: cars[index].id)));
            },
            child: CarTile(
              name: cars[index].name,
              price: cars[index].price.toString(),
              mileage: cars[index].mileage,
              transactionDate: cars[index].transactionDate,
            ),
          );
        },
      ),
    );
  }
}