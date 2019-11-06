import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'courseDetails.dart';



class courseDetails extends StatefulWidget {
  @override
  _courseState createState()=> new _courseState();
}

class _courseState extends State<courseDetails>{
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: (){
          _scaffoldKey.currentState.openDrawer();
        }),
        title: Text("ak Academy"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text("Profile",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: new Color(0x5fc911f8),

              ),
            ),
            ListTile(
              title: Text("Menu1"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Menu2"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Menu3"),
              onTap: (){
                Navigator.pop(context);
              },
            ),

          ],
        ),

      ),


      body:ListView(
        children: <Widget>[

    Center(
    child: Stack(

        children: <Widget>[


        Container(
          margin: const EdgeInsets.only(top:30.0),
        decoration: BoxDecoration(

    image: DecorationImage(

    image: AssetImage('Images/java.png'),
    fit: BoxFit.fitWidth)),
    height: 250.0,
    width: MediaQuery.of(context).size.width,
    ),


    ],

    ),


    ),
          Container(
            child: ListView(
              children: <Widget>[
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  child: Text(
                    "18 hours in-demand",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  child: Text(
                    "Support Files",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),

                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  child: Text(
                    "5 Articles",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  child: Text(
                    "Certification of Completion",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),


              ],
            ),
          ),


        ],
    ),


      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text('Enroll Now'),
        icon: Icon(Icons.thumb_up),
        backgroundColor: Colors.pink,
      ),
    );


  }
}