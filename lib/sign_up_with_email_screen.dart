import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final databaseReference = Firestore.instance;
final emailController = TextEditingController();
final passwordController = TextEditingController();

class SignUpWithEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /* theme: ThemeData(
         */ /* primaryColor: Color(0xFFFB415B),*/ /*
          */ /*fontFamily: "Ubuntu"*/ /*
      ),*/
      home: _SignUpWithEmail(),
    );
  }
}

class _SignUpWithEmail extends StatefulWidget {
  @override
  _SignUpWithEmailState createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<_SignUpWithEmail> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding:
            EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            Text(
              'Spice',
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico"),
            ),
            SizedBox(
              height: 40.0,
            ),
            /* Text(
              "LOGIN",
              style: TextStyle(
                  */ /*fontSize: 32.0,
                  fontWeight: FontWeight.bold,*/ /*
                  color: Theme.of(context).primaryColor
              ),
            ),*/
            /*Text(
              'Email',
            ),*/
            SizedBox(
              height: 20.0,
            ),
            buildTextField("Email", emailController),
            SizedBox(
              height: 20.0,
            ),
            /*Text(
              'Password',
            ),*/
            SizedBox(
              height: 20.0,
            ),
            buildTextField("Password", passwordController),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  /* Text(
                    "Forgotten Password?",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),*/
                ],
              ),
            ),
            SizedBox(height: 70.0),
            buildButtonContainer(),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.grey,
                      textColor: Colors.black45,
                      child: Text("Sign Up"),
                      onPressed: () {
                        doesEmailExists().then((isEmailExists) {
                          if (isEmailExists) {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                    title: Text("Email Exists"),
                                    content: Text("User Already Exists.")));
                          } else {
                            signupUser().then((s) {
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                      title: Text("User Registered"),
                                      content: Text(
                                          "User Registered Successfully.")));
                            });
                          }
                        });
                      },
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    /*Text("SIGN UP", style: TextStyle(color: Theme.of(context).primaryColor,))*/
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, TextEditingController textController) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
            /* borderRadius: BorderRadius.circular(20.0),*/
            ),
        prefixIcon: hintText == "Email" ? Icon(Icons.email) : Icon(Icons.lock),
        suffixIcon: hintText == "Password"
            ? IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      obscureText: hintText == "Password" ? _isHidden : false,
    );
  }

  Widget buildButtonContainer() {
    return Center(
      child: Row(
        children: <Widget>[
          Container(
            width: 40.0,
          ),
          Expanded(
            child: RaisedButton(
              color: Colors.grey,
              textColor: Colors.black45,
              child: Text(
                "Male",
              ),
              onPressed: () {},
            ),
          ),
          Container(
            width: 40.0,
          ),
          Expanded(
            child: RaisedButton(
              color: Colors.grey,
              textColor: Colors.black45,
              child: Text(
                "Female",
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Future<String> signupUser() async {
    DocumentReference ref = await databaseReference.collection("users").add(
        {'email': emailController.text, 'password': passwordController.text});
    return ref.documentID;
  }

  Future<bool> doesEmailExists() async {
    final QuerySnapshot result = await databaseReference
        .collection("users")
        .where('email', isEqualTo: emailController.text)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    return documents.length == 1;
  }
}
