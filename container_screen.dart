import 'dart:math';

import 'package:flutter/material.dart';

class ContainerScreen extends StatefulWidget {
  @override
  _ContainerScreenState createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  double _height = 200.0;
  double _width = 200.0;
  double _angle = 0.0;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Animated Test'),
      ),
      body: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: Transform.rotate(
            angle: _angle,
            child: AnimatedContainer(
              padding: EdgeInsets.all(5),
              alignment: Alignment.topCenter,
              duration: Duration(seconds: 2),
              height: _height,
              width: _width,
              decoration:
                  BoxDecoration(color: _color, borderRadius: _borderRadius),
              curve: Curves.fastOutSlowIn,
              child: Text(
                'Tap to Rotate',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        onTap: () {
          print('screen tapped');
          setState(() {
            final randomNumber = Random();
            _width = randomNumber.nextInt(300).toDouble();
            _angle = 45.0;
           _height = randomNumber.nextInt(300).toDouble();
            _color = Color.fromRGBO(randomNumber.nextInt(300),
                randomNumber.nextInt(300), randomNumber.nextInt(300), 1);
           // _borderRadius =
                BorderRadius.circular(randomNumber.nextInt(300).toDouble());
          });
        },
      ),
    );
  }
}
