import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zealy/sign_up_screnn.dart';
import 'package:zealy/slide_dots.dart';
import 'package:zealy/slide_item.dart';
import 'package:zealy/slide_model.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  // ignore: must_call_super
  void initState() {
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < slideList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 200), curve: Curves.easeInCirc);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChange(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: _onPageChange,
                    scrollDirection: Axis.horizontal,
                    itemCount: slideList.length,
                    itemBuilder: (context, i) => SlideItem(i),
                  ),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (int i = 0; i < slideList.length; i++)
                              if (i == _currentPage)
                                SlideDots(true)
                              else
                                SlideDots(false),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Material(
                    /*elevation: 5,*/
                    /*borderRadius: BorderRadius.circular(0),*/
                    color: Colors.grey,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          letterSpacing: 1.2,
                          /*fontWeight: FontWeight.bold*/
                        ),
                      )),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Material(
                    /*elevation: 5,*/
                    borderRadius: BorderRadius.circular(0),
                    color: Colors.black12,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          letterSpacing: 1.2,
                        ),
                      )),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
