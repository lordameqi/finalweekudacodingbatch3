import 'package:flutter/material.dart';

class Finance2 extends StatefulWidget {
  @override
  _Finance2State createState() => _Finance2State();
}

class _Finance2State extends State<Finance2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Finance kedua'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            Text("Informasi Finance kedua"),
            SizedBox(
              height: 8.0,
            ),
            Text("ini juga isinya")
          ],
        ),
      ),
    );
  }
}
