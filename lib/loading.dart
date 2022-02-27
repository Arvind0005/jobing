import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinkit extends StatefulWidget {
  @override
  _SpinkitState createState() => _SpinkitState();
}

class _SpinkitState extends State<Spinkit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitChasingDots(
          color: Color(0xff64485C),
          size: 50.0,
        ),
      ),
    );
  }
}
