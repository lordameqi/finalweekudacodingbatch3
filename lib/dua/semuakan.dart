import 'package:flutter/material.dart';
import 'hemat.dart';

class Semuakan extends StatefulWidget {
  @override
  _SemuakanState createState() => _SemuakanState();
}

class _SemuakanState extends State<Semuakan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips Hemat'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            child: Column(
              children: <Widget>[
                Text("Tips Hemat"),
                FlatButton(
                  color: Color.fromRGBO(161, 108, 164, 1.0),
                  child: const Text('Read Article'),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => Hemat()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
