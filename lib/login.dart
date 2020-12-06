import 'package:flutter/material.dart';
import 'beranda.dart';
import 'register.dart';
import 'registerkan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String username, password;
  final _key = new GlobalKey<FormState>();

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final response = await http.post(
        "http://192.168.1.5/finalweek/loginkan.php",
        body: {"username": username, "password": password});
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String usernameAPI = data['username'];
    String passwordAPI = data['password'];
    String id = data['id_user'];
    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, usernameAPI, passwordAPI, id);
      });
      print(pesan);
    } else {
      print(pesan);
    }
  }

  savePref(int value, String username, String password, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("username", username);
      preferences.setString("password", password);
      preferences.setString("id", id);

      preferences.commit();
    });
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);

      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        final logo = Hero(
          tag: 'hero',
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 48.0,
            child: Image.asset('assets/images/logo.png'),
          ),
        );

        final usernamekan = TextFormField(
          keyboardType: TextInputType.text,
          validator: (e) {
            if (e.isEmpty) {
              return "Masukkan Username anda";
            }
            return null;
          },
          onSaved: (e) => username = e,
          autofocus: false,
          decoration: InputDecoration(
            hintText: 'Username',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        );
        final passwordkan = TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          onSaved: (e) => password = e,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        );

        final loginbutton = Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Beranda()));
                check();
              },
              color: Colors.lightBlue,
              child: Text(
                'Log In',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );

        final registerbutton = FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Registerkan()));
            },
            child: Text('Register'));
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('LOGIN'),
            centerTitle: true,
          ),
          body: Form(
            key: _key,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                Center(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60.0,
                        ),
                        logo,
                        SizedBox(
                          height: 48.0,
                        ),
                        usernamekan,
                        SizedBox(
                          height: 8.0,
                        ),
                        passwordkan,
                        SizedBox(
                          height: 24.0,
                        ),
                        loginbutton,
                        registerbutton
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        return Beranda(signOut);
        break;
    }
  }
}
