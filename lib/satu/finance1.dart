import 'package:flutter/material.dart';

class Finance1 extends StatefulWidget {
  @override
  _Finance1State createState() => _Finance1State();
}

class _Finance1State extends State<Finance1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Finance Satu'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            Text("Informasi Finance Satu"),
            SizedBox(
              height: 8.0,
            ),
            Text("ini isinya")
          ],
        ),
      ),
    );
  }
}
