import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ProfileScreen.dart';
import 'splace_screen.dart';
import 'index.dart';


void main() => runApp(
  new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState()=> new _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  void initState(){
    super.initState();
    new Future.delayed(
      const Duration(seconds: 3),
        ()=>Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>GoogleSignApp()),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(

        fit: StackFit.expand,

        children: <Widget>[

          Container(
            decoration: BoxDecoration(
                color: new Color(0xff622f74),
                gradient: LinearGradient(
                  colors: [new Color(0xfffccb49),new Color(0xff65ce8e)],
                  begin: Alignment.center,
                  end: Alignment.centerLeft,
                )
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              CircleAvatar(

                backgroundColor: Colors.white,
                radius: 75.0,
                child: Image.asset('Images/ak_logo.png'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              )
            ],
          ),

        ],
      ),
    );
  }

}

class GoogleSignApp extends StatefulWidget {
  @override
  _GoogleSignAppState createState() => _GoogleSignAppState();
}

class _GoogleSignAppState extends State<GoogleSignApp> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async {

    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Sign in'),
    ));

    final GoogleSignInAccount googleUser = await _googlSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser userDetails = (await _firebaseAuth.signInWithCredential(credential)).user;
    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);

    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
      userDetails.providerId,
      userDetails.displayName,
      userDetails.photoUrl,
      userDetails.email,
      providerData,
    );
   // print("hello: " +userDetails.email);
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => index(),
      ),
    );
    return userDetails;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height:  MediaQuery.of(context).size.height,
              child: Image(

                image: AssetImage(
                    "Images/background.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height:10.0),
                Container(
                    width: 250.0,
                    child: Align(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Color(0xffffffff),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.google,color: Color(0xffCE107C),),
                            SizedBox(width:10.0),
                            Text(
                              'Sign in with Google',
                              style: TextStyle(color: Colors.black,fontSize: 18.0),
                            ),
                          ],),
                        onPressed: () => _signIn(context)
                            .then((FirebaseUser user) => print(user))
                            .catchError((e) => print(e)),
                      ),
                    )
                ),

                Container(
                    width: 250.0,
                    child: Align(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Color(0xffffffff),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.facebookF,color: Color(0xff4754de),),
                            SizedBox(width:10.0),
                            Text(
                              'Sign in with Facebook',
                              style: TextStyle(color: Colors.black,fontSize: 18.0),
                            ),
                          ],),
                        onPressed: () {},
                      ),
                    )
                ),
                Container(
                    width: 250.0,
                    child: Align(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Color(0xffffffff),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.solidEnvelope,color: Color(0xff4caf50),),
                            SizedBox(width:10.0),
                            Text(
                              'Sign in with Email',
                              style: TextStyle(color: Colors.black,fontSize: 18.0),
                            ),
                          ],),
                        onPressed: () {},
                      ),
                    )
                ),
              ],
            ),
          ],
        ),),
    );
  }
}



class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails,this.userName, this.photoUrl,this.userEmail, this.providerData);
}


class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}