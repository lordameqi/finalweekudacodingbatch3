import 'package:flutter/material.dart';
import 'home.dart';
import 'keuangan.dart';
import 'profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Beranda extends StatefulWidget {
  final VoidCallback signOut;
  Beranda(this.signOut);
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  "Beranda",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Tab(
                child: Text(
                  "Keuangan",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Tab(
                child: Text(
                  "Profile",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
          title: Text('APlikasi Canggih'),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.lock_open),
                onPressed: () {
                  signOut();
                })
          ],
        ),
        body: TabBarView(
          children: [Home(), Keuangan(), Profile()],
        ),
      ),
    );
  }
}
