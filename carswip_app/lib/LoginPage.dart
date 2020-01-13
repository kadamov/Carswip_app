import 'package:carswip_app/home.dart';

import 'Animations/FadeAnimation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo.png',width: 360,),
            FadeAnimation(1.2, Text("Login",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)),
            SizedBox(height: 10,),
            FadeAnimation(2.0, Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[300]))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                        hintText: "Email or Phone number"
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                        hintText: "Password"
                      ),
                    ),
                  ),
                ],
              ),
            )),
            SizedBox(height: 40,),
            FadeAnimation(1.8, Center(
              child: Container(
                width: 120,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.orange[800]
                ),
                child: RaisedButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),color: Colors.orange,
                  child: Center(child: Text("Sign in", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white.withOpacity(.9)),)), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Home()),
                  );
                  },
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}


