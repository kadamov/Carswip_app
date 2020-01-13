import 'package:flutter/material.dart';
import 'package:carswip_app/carousel_slider.dart';
import 'package:carswip_app/page_transition.dart';
import 'Animations/FadeAnimation.dart';
import 'package:carswip_app/LoginPage.dart';
import 'attr.dart';
import 'package:carswip_app/home.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Application Intro',
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentPage(),
    );
  }
}

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: CarouselSlider(
        autoPlay: false,
        enableInfiniteScroll: false,
        initialPage: 0,
        reverse: false,
        viewportFraction: 1.0,
        aspectRatio: MediaQuery.of(context).size.aspectRatio,
        height: MediaQuery.of(context).size.height - 30,
        items: [0, 1, 2].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  color: bgrColor,
                  child: AppIntro(i));
            },
          );
        }).toList(),
      ),
    );
  }
}

class AppIntro extends StatefulWidget {
  int index;
  AppIntro(this.index);
  @override
  _AppIntroState createState() => _AppIntroState();
}

class _AppIntroState extends State<AppIntro> {
  @override
  void initState() {

    super.initState();
    print(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 12,
                left: 24,
                child: Text(
                  "CARSWIP",
                  style: TextStyle(fontFamily: 'AvenirBold',
                      fontSize: 20,

                  ),
                ),
              ),
              Positioned(
                right: 5,
                top: 0,
                child: RaisedButton(elevation: 0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),color:bgrColor,
                  child: new Text(
                    widget.index == 2 ? "DONE" : "SKIP",
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontFamily: 'SultanNahia'),
                  ), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),
                );
                },
                )
                ,
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 0),
          height: MediaQuery.of(context).size.height - 160,
          padding: EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: <Widget>[
              Image.asset(imagePath[widget.index],fit: BoxFit.fitWidth,),
              Padding(padding: EdgeInsets.only(top: 40),
                child: Center(child:  new Text(title[widget.index],
                    style: TextStyle(
                        fontFamily: 'Caslon',
                        fontSize: 30
                    )),),
              ),
               Container(
                 margin: EdgeInsets.only(top: 24),
                 padding: EdgeInsets.symmetric(horizontal: 45),
                 child: new RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text: description[widget.index],
                              style: new TextStyle(fontFamily: 'Avenir')),
                          new TextSpan(
                              text: widget.index == 0 ? 'CARSWIP' : '',
                              style: new TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'AvenirBold'))
                        ])),
               )


            ],
          ),
        ),
        Container(margin: EdgeInsets.symmetric(horizontal: 24),height:80,child: Stack(children: <Widget>[
    DotsIndicators(widget.index),
            Center(child: new Text(widget.index !=2 ? 'Scroll Right' : '',style: TextStyle(fontFamily: "Avenir", fontSize: 10),)),
            Positioned(top: widget.index !=2 ? 36 : 0,right: 0,child: widget.index != 2 ? Image.asset('assets/images/arrow.png',width: 30,) : LetsGo())
        ],),)
      ],
    );
  }
}
class DotsIndicators extends StatefulWidget {
  int pageIndex;
  DotsIndicators(this.pageIndex);
  @override
  _DotsIndicatorsState createState() => _DotsIndicatorsState();
}

class _DotsIndicatorsState extends State<DotsIndicators> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(scrollDirection: Axis.horizontal,itemCount: 3,itemBuilder: (context,int index){
      return Container(
        margin: EdgeInsets.only(right: index != 2 ? 20 : 0),
        width: 10,
        height: 10,
        decoration: BoxDecoration(border: Border.all(color: Colors.orange),shape: BoxShape.circle,color: index == widget.pageIndex ? Colors.orange : Colors.white),
      );
    },);
  }
}
class LetsGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: MediaQuery.of(context).size.height,
      child: Stack(children: <Widget>[
        Positioned(left: 25,top: 12,child: RaisedButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),color: Colors.orange,
          child: Text('Continue',style: TextStyle(color: Colors.white,fontFamily: 'AvenirBold')), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),
        );
        },
        ) )
      ],),
    );

  }
}
