import 'package:flutter/material.dart';
import './tambahBarangBelanjaan.dart';
// import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Note'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_)=>TambahBarangBelanjaan())),
              color: Colors.amber,
              child: Text('Tambah Kebutuhan'),
          ),
        ],
      ),
    );
  }
}


