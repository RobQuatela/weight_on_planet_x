import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int radioValue = 0;
  final TextEditingController _weightController = new TextEditingController();
  String _formattedText = '';
  double _result = 0.0;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;

      switch (value) {
        case 0:
          _result = _calculateWeight(_weightController.text, 0.6);
          _formattedText = 'Your weight on Pluto is '  + _result.toStringAsFixed(2) + ' lbs';
          break;
        case 1:
          _result = _calculateWeight(_weightController.text, 0.38);
          _formattedText = 'Your weight on Mars is '  + _result.toStringAsFixed(2) + ' lbs';
          break;
        case 2:
          _result = _calculateWeight(_weightController.text, 0.91);
          _formattedText = 'Your weight on Venus is '  + _result.toStringAsFixed(2) + ' lbs';
          break;
      }
    });
  }

  double _calculateWeight(String weight, double multiplier) {
    try {
      if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
        return int.parse(weight) * multiplier;
      } else {
        return 0.0;
      }
    } catch (e) {
      print(e.toString());
      return 0.0;
    }
  }

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
              margin: EdgeInsets.only(
                  top: 5.0, bottom: 5.0, left: 20.0, right: 20.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Weight on Earth',
                      hintText: 'Lbs',
                      icon: new Icon(Icons.line_weight),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //radio buttons
                      new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        'Pluto',
                        style: new TextStyle(
                          color: Colors.white30,
                        ),
                      ),
                      new Radio<int>(
                          activeColor: Colors.redAccent,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        'Mars',
                        style: new TextStyle(
                          color: Colors.white30,
                        ),
                      ),
                      new Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        'Venus',
                        style: new TextStyle(
                          color: Colors.white30,
                        ),
                      ),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(15.0)),
                  new Text(
                    _weightController.text.isEmpty ? "Please enter weight" : _formattedText,
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
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
