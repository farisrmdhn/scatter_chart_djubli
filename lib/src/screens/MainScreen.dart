// Packages
import 'package:flutter/material.dart';

// Models
import '../models/Car.dart';

// Pages
import '../pages/MpvPage.dart';
import '../pages/SedanPage.dart';
import '../pages/SuvPage.dart';

class MainScreen extends StatefulWidget {
  final Car car;

  MainScreen({this.car});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  // Pages Init (for car types)
  MpvPage mpvPage;
  SedanPage sedanPage;
  SuvPage suvPage;

  Widget currentPage;

  // Custom Car Type Selector
  static TextStyle selectedNavStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pinkAccent);
  static TextStyle defaultNavStyle = TextStyle(fontSize: 24);
  TextStyle mpvNavStyle = selectedNavStyle;
  TextStyle sedanNavStyle = defaultNavStyle;
  TextStyle suvNavStyle = defaultNavStyle;

  @override
  void initState() {
    
    super.initState();

    // Create an instance of all pages accesible in car type selector
    mpvPage = MpvPage();
    sedanPage = SedanPage();
    suvPage = SuvPage();

    currentPage = mpvPage;

    // print("Initiating State");
    // widget.model.fetchDetectors();
    // widget.model.fetchInputs();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildSearchField() {
    return Container(
      width: 275,
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 2.5),
      child: TextField(
        autocorrect: true,
        decoration: InputDecoration(
          hintText: 'Cari Mobil Impianmu!',
          prefixIcon: Icon(Icons.search, color: Colors.pinkAccent,),
          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18),
          filled: true,
          fillColor: Colors.white70,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(110)),
            borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(110)),
            borderSide: BorderSide(color: Colors.pinkAccent, width: 3),
          ),
        ),
      )
    );
    
  }

  Widget _buildTypeSelector() {
    return Row(
      children: <Widget> [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      mpvNavStyle = selectedNavStyle;
                      sedanNavStyle = defaultNavStyle;
                      suvNavStyle = defaultNavStyle;
                      currentPage = mpvPage;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'MPV',
                      style: mpvNavStyle,
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      mpvNavStyle = defaultNavStyle;
                      sedanNavStyle = selectedNavStyle;
                      suvNavStyle = defaultNavStyle;
                      currentPage = sedanPage;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'Sedan',
                      style: sedanNavStyle,
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      mpvNavStyle = defaultNavStyle;
                      sedanNavStyle = defaultNavStyle;
                      suvNavStyle = selectedNavStyle;
                      currentPage = suvPage;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'SUV',
                      style: suvNavStyle,
                    ),
                  ),
                ),
                Spacer(),
              ],
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.only(top: 35),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
            ),
            child: Row(
              children: <Widget>[
                SizedBox(width: 10),
                Text(
                  'DjuBli',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Spacer(),   
                _buildSearchField(),
              ],
            ),
          ),
          SizedBox(height: 25),
          _buildTypeSelector(),
          SizedBox(height: 10),
          currentPage,
        ],
      ),
    );
  }
}