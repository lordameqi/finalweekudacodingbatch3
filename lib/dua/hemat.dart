import 'package:flutter/material.dart';

class Hemat extends StatefulWidget {
  @override
  _HematState createState() => _HematState();
}

class _HematState extends State<Hemat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips Hemat'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            Text("Tips Hemat"),
            SizedBox(
              height: 8.0,
            ),
            Text(
                "Sadari bagian mana yang membuat Anda menjadi overspending, Siapkan peraturan untuk mencegah pembelian impulsif, Hindari kartu kredit, gunakan uang tunai, Carilah cara untuk menghindari godaan, Mulai gunakan anggaran, Buatlah rekening bank terpisah, Lacak pengeluaran Anda, Temukan cara yang lebih murah untuk mendapatkan apa yang Anda inginkan")
          ],
        ),
      ),
    );
  }
}
