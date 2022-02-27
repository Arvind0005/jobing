import 'package:flutter/material.dart';

class NoData extends StatefulWidget {
  @override
  _NoDataState createState() => _NoDataState();
}

class _NoDataState extends State<NoData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("sorry no jobs found")),
    );
  }
}
