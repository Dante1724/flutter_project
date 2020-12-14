import 'dart:ui';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
// import 'package:image/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas_akhir/helpers/databaseHelper.dart';
import 'package:tugas_akhir/main.dart';

final dbHelper = DatabaseHelper.instance;

class TambahBarangBelanjaan extends StatefulWidget {
  @override
  _TambahBarangBelanjaanState createState() => _TambahBarangBelanjaanState();
}

class _TambahBarangBelanjaanState extends State<TambahBarangBelanjaan> {
  File foto;
  final formKeyNamaBarang = GlobalKey<FormState>();
  final formKeyJumlahBarang = GlobalKey<FormState>();
  String namaBarang;
  String jumlah;
  int status = 0;

  openCamera() async{
    foto = await ImagePicker.pickImage(source: ImageSource.camera, maxHeight: 144, maxWidth: 144);
    setState(() {

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
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Form(
            key: formKeyNamaBarang,
            autovalidateMode: AutovalidateMode.always,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    onSaved: (newValue) => namaBarang = newValue,
                    validator: (value){
                      if(value.isEmpty){
                        return "Jumlah tidak boleh kosong";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Nama Barang',
                      hintText: 'Masukkan nama barang',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: <Widget>[
              Container(
                height: 20,
              ),
            ],
          ),

          Form(
            autovalidateMode: AutovalidateMode.always,
            key: formKeyJumlahBarang,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]+'))],
                  validator: (value){
                    value.toLowerCase();
                    if(value.isEmpty){
                      return "Jumlah tidak boleh kosong";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) => jumlah = newValue,
                  decoration: InputDecoration(
                    labelText: 'Jumlah',
                    hintText: 'Masukkan jumlah Barang',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),),

          Row(
            children: <Widget>[
              RaisedButton(
                child: Text('Take a photo with camera'),
                onPressed: openCamera,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              foto == null ? Text('Gambar not found') : Image.file(foto),
          ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: submit,
                child: Text('Submit'),
              ),)
            ],
          ),
        ],
      ),
    );
  }
  void submit(){
    setState((){
      if(formKeyNamaBarang.currentState.validate() && formKeyJumlahBarang.currentState.validate()){
        formKeyNamaBarang.currentState.save();
        formKeyJumlahBarang.currentState.save();
        _insert();
        print("Form Validation : " + formKeyJumlahBarang.currentState.validate().toString());
        print(namaBarang);
        print(jumlah);
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
      }else{
        print("Form Validation : " + formKeyJumlahBarang.currentState.validate().toString());
      }
    });
  }

  void _insert() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnNama : namaBarang,
      DatabaseHelper.columnJumlah : jumlah,
      DatabaseHelper.columnStatus : status,
      DatabaseHelper.columnFoto : foto,
    };
    final id = await dbHelper.insert(row);
    print('row yang dimasukkan id: $id');
  }
}


