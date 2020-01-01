import 'package:flutter/material.dart';
import 'package:zealy/sign_up_with_email_screen.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _SignUp(),
    );
  }
}

class _SignUp extends StatefulWidget {
  @override
  Sign createState() => Sign();
}

class Sign extends State<_SignUp> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40.0,),
        Container(
          height: 350.0,
          width: 350.0,
          color: Colors.grey,
          margin: EdgeInsets.all(20.0),
          child:Center(child:Text('image'),), /*Image(image: AssetImage('onboard/onboard_1.png')),*/
        ),
            InkWell(
              onTap: () {
               /* Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));*/
              },
              child: Material(
                /*elevation: 5,*/
                /*borderRadius: BorderRadius.circular(0),*/
                color: Colors.black12,
                child: Container(
                  height: 60,
                  width: 330,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                        "Callout",
                        style: TextStyle(
                          fontSize: 24,

                          color: Colors.black,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ),
            Container(
              height: 20.0,
              color: Colors.white,
            ),
            InkWell(
              onTap: () {
                /* Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));*/
              },
              child: Material(
                /*elevation: 5,*/
                /*borderRadius: BorderRadius.circular(0),*/
                color: Colors.grey,
                child: Container(
                  height: 60,
                  width: 330,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                        "Sign In with Google",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          letterSpacing: 1,
                          /*fontWeight: FontWeight.bold*/),
                      )),
                ),
              ),
            ),
            Container(
              height: 20.0,
              color: Colors.white,
            ),
            InkWell(
              onTap: () {
                /* Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));*/
              },
              child: Material(
                /*elevation: 5,*/
                /*borderRadius: BorderRadius.circular(0),*/
                color: Colors.black12,
                child: Container(
                  height: 60,
                  width: 330,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                        "Sign In with Facebook",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          letterSpacing: 1,
                          /*fontWeight: FontWeight.bold*/),
                      )),
                ),
              ),
            ),
            Container(
              height: 20.0,
              color: Colors.white,
            ),
            InkWell(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpWithEmail()));
              },
              child: Material(
                /*elevation: 5,*/
                /*borderRadius: BorderRadius.circular(0),*/
                color: Colors.white,
                child: Container(
                  height: 60,
                  width: 330,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                        "Sign Up with Email",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          letterSpacing: 1,
                          /*fontWeight: FontWeight.bold*/),
                      )),
                ),
              ),
            ),
            Container(
              height: 20.0,
              color: Colors.white,
            ),


          ],
        ),
      )

    );
  }
}
