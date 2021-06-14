// Packages
import 'package:flutter/material.dart';

// Pages
import '../pages/MpvPage.dart';
import '../pages/SedanPage.dart';
import '../pages/SuvPage.dart';

class MainScreen extends StatefulWidget {

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
  static TextStyle selectedNavStyle = TextStyle(fontSize: 20, color: Colors.pinkAccent);
  static TextStyle defaultNavStyle = TextStyle(fontSize: 20, color: Colors.grey[500]);
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

      body: _buildBody(),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Temukan Mobil Impianmu!',
        hintStyle: TextStyle(
          fontSize: 18,
          color: Colors.grey[500],
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            width: 0, 
            style: BorderStyle.none,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            width: 2.5, 
            style: BorderStyle.solid,
            color: Color(0xFFFF5A5F)
          ),
        ),
        filled: true,
        fillColor: Colors.grey[250],
        contentPadding: EdgeInsets.all(20),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 8.0),
          child: Icon(
            Icons.search,
            color: Colors.grey[500],
            size: 28,
          ),
        ),
      ),
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
                    padding: EdgeInsets.all(5),
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
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            _buildSearchField(),
            SizedBox(height: 10),
            _buildTypeSelector(),
            SizedBox(height: 5),
            currentPage,
          ],
        ),
      ),
    );
  }
}