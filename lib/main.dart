import 'package:flutter/material.dart';
import './tambahBarangBelanjaan.dart';
import './models/daftarBelanja.dart';
import './helpers/databaseHelper.dart';
// import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<DaftarBelanja>> _daftarBelanja;

  @override
  void initState() {
    super.initState();
    _updateDaftarBelanja();
  }

  _updateDaftarBelanja(){
    setState((){
      _daftarBelanja = DatabaseHelper.instance.daftarBelanja();
    });
  }

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


// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Note'),
//         centerTitle: true,
//         backgroundColor: Colors.redAccent,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           RaisedButton(
//               onPressed: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_)=>TambahBarangBelanjaan())),
//               color: Colors.amber,
//               child: Text('Tambah Kebutuhan'),
//           ),
//         ],
//       ),
//     );
//   }
// }


