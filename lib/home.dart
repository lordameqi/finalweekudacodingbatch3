import 'package:flutter/material.dart';
import 'satu/semua.dart';
import 'dua/semuakan.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => Semua()));
                    },
                    child: Container(
                      child: Text('Finance'),
                      width: 100,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/finance.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => Semuakan()));
                    },
                    child: Container(
                      child: Text('Tips Hemat'),
                      width: 100,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/hemat.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
