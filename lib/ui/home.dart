import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }

}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Weight on Planet X'),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              height: 130.0,
              width: 200.0,
            ),
            new Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 20.0, right: 20.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: null,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Weight on Earth',
                      hintText: 'Lbs',
                      icon: new Icon(Icons.line_weight),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}