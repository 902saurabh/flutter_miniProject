import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'courseDetails.dart';


class index extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  // This widget is the root of your application.

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


      body:new MyHomePage(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:Colors.brown,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.watch_later),
              title: Text('WishList'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library),
              title: Text('My Courses'),
            ),
          ],




        ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int photoIndex = 0;

  List<String> photos = [
    'Images/course1.jpg',
    'Images/course2.jpg',
    'Images/course3.jpg',
    'Images/course4.jpg'
  ];

  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
          children: <Widget>[

            Center(
              child: Stack(

                children: <Widget>[


                 Container(

                    decoration: BoxDecoration(

                        image: DecorationImage(

                            image: AssetImage(photos[photoIndex]),
                            fit: BoxFit.fitWidth)),
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    top: 180.0,
                    left: 25.0,
                    right: 25.0,
                    child: SelectedPhoto(numberOfDots: photos.length, photoIndex: photoIndex),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Prev'),
                  onPressed: _previousImage,
                  elevation: 5.0,
                  color: Colors.blue,
                )
                ,
                SizedBox(width: 10.0),

                RaisedButton(
                child: Text('Next'),
                onPressed: _nextImage,
                elevation: 5.0,
                color: Colors.green,
                )
              ],
            ),
            SizedBox(width:20.0),
            Text("Categories",
              style: TextStyle(color: Colors.black,fontSize: 18.0)
            ),
  Row(

    children: <Widget>[
      Chip(
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text('P'),
        ),
        label: Text('Python'),
      ),
      SizedBox(width:20.0),
      Chip(
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text('J'),
        ),
        label: Text('java'),
      ),
      SizedBox(width:20.0),
      Chip(
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text('C'),
        ),
        label: Text('C++'),
      ),

    ],
  ),

            Row(
              children: <Widget>[
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey.shade800,
                    child: Text('W'),
                  ),
                  label: Text('Web Development'),

                ),
                SizedBox(width:20.0),
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey.shade800,
                    child: Text('A'),
                  ),
                  label: Text('Android'),
                ),

              ],
            ),

            Text("  List of Available Courses!",
              style: TextStyle(color: Colors.black,fontSize: 18.0)),
            SizedBox(width:20.0),
             InkWell(
               onTap: ()=>Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context)=>courseDetails()),
               ),
               child:  Container(

                 child: new FittedBox(
                   child: Material(
                       color: Colors.white,
                       elevation: 14.0,
                       borderRadius: BorderRadius.circular(24.0),
                       shadowColor: Color(0x802196F3),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           Container(
                             child: Padding(
                               padding: const EdgeInsets.only(left: 16.0),
                               child: courseDetail(),
                             ),
                           ),

                           Container(
                             width: 250,
                             height: 200,
                             child: ClipRRect(
                               borderRadius: new BorderRadius.circular(24.0),
                               child: Image(
                                 fit: BoxFit.contain,
                                 alignment: Alignment.topRight,
                                 image: AssetImage(
                                     "Images/anime.jpg"),
                               ),
                             ),),
                         ],)
                   ),
                 ),
               ),

            ),

            SizedBox(width:20.0),
            Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: courseDetail2(),
                          ),
                        ),
            SizedBox(width:20.0),
                        Container(
                          width: 250,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage(
                                  "Images/ak_logo.png"),
                            ),
                          ),),
                      ],)
                ),
              ),
            ),
            SizedBox(width:20.0),
            Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: courseDetail(),
                          ),
                        ),

                        Container(
                          width: 250,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage(
                                  "Images/anime.jpg"),
                            ),
                          ),),
                      ],)
                ),
              ),
            ),
            SizedBox(width:20.0),
            Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: courseDetail(),
                          ),
                        ),

                        Container(
                          width: 250,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage(
                                  "Images/anime.jpg"),
                            ),
                          ),),
                      ],)
                ),
              ),
            ),
            SizedBox(width:20.0),
            Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: courseDetail(),
                          ),
                        ),

                        Container(
                          width: 250,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage(
                                  "Images/anime.jpg"),
                            ),
                          ),),
                      ],)
                ),
              ),
            ),
          ],
        );
  }

  Widget courseDetail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Tokyo Ghoul",
            style: TextStyle(color: Color(0xffe6020a), fontSize: 24.0,fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[


                  Container(child: SmoothStarRating(
                      allowHalfRating: false,
                      onRatingChanged: (v) {

                        setState(() {});
                      },
                      starCount: 5,
                      rating: 4,
                      size: 40.0,
                      color: Colors.green,
                      borderColor: Colors.green,
                      spacing:0.0
                  )),
                ],)),
        ),
        Container(child: Text("Horror \u00B7 Dark",
          style: TextStyle(color: Colors.black54, fontSize: 18.0,fontWeight: FontWeight.bold),)),
      ],
    );
  }

  Widget courseDetail2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Attack on Titan",
            style: TextStyle(color: Color(0xffe6020a), fontSize: 24.0,fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[


                  Container(child: Text("Great Anime \u00B7 5.0 stars",
                    style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
                ],)),
        ),
        Container(child: Text("Servival \u00B7 Dark",
          style: TextStyle(color: Colors.black54, fontSize: 18.0,fontWeight: FontWeight.bold),)),
      ],
    );
  }
}

class SelectedPhoto extends StatelessWidget {

  final int numberOfDots;
  final int photoIndex;

  SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return new Container(
        child: new Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 3.0),
          child: Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4.0)
            ),
          ),
        )
    );
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0.0,
                    blurRadius: 2.0
                )
              ]
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for(int i = 0; i< numberOfDots; ++i) {
      dots.add(
          i == photoIndex ? _activePhoto(): _inactivePhoto()
      );
    }

    return dots;
  }


  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}