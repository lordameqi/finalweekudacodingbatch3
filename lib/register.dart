import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController cUsername = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController cEmail = TextEditingController();

  String nUsername, nEmail, nPassword;
  final _keyForm = GlobalKey<FormState>();

  checkForm() {
    final form = _keyForm.currentState;
    if (form.validate()) {
      form.save();
      submitDataRegister();
    }
  }

  submitDataRegister() async {
    final responseData = await http.post(
        "http://192.168.1.6/finalweek/registerkan.php",
        body: {"username": nUsername, "email": nEmail, "password": nPassword});
    final data = jsonDecode(responseData.body);
    int value = data['value'];
    String pesan = data['message'];
    //cek value
    if (value == 1) {
      setState(() {
        Navigator.pop(context);
      });
    } else if (value == 2) {
      print(pesan);
    } else {
      print(pesan);
    }
  }

  @override
  Widget build(BuildContext context) {
    //final _keyForm = GlobalKey<FormState>();
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/images/logo.png'),
      ),
    );

    final username = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: cUsername,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Input Username';
        }
        return null;
      },
      onSaved: (value) => nUsername = cUsername.text,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: cEmail,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Input Email';
        }
        return null;
      },
      onSaved: (value) => nEmail = cEmail.text,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: cPassword,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Input Password';
        }
        return null;
      },
      onSaved: (value) => nPassword = cPassword.text,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
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
            setState(() {
              checkForm();
            });
          },
          color: Colors.lightBlue,
          child: Text(
            'Daftar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('LOGIN'),
        centerTitle: true,
      ),
      body: Form(
        key: _keyForm,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    logo,
                    SizedBox(
                      height: 48.0,
                    ),
                    username,
                    SizedBox(
                      height: 8.0,
                    ),
                    password,
                    SizedBox(
                      height: 8.0,
                    ),
                    email,
                    SizedBox(
                      height: 24.0,
                    ),
                    loginbutton,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
