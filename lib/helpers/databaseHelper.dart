import 'package:sqflite/sqflite.dart';

final String tableShoppingNote = 'shopping_note';
final String columnId = '_id';
final String columnNama = 'nama';
final String columnJumlah = 'jumlah';
final String columnSelesai = 'selesai';

class DatabaseHelper{
  int id, jumlah;
  String nama;
  bool selesai;

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      columnNama: nama,
      columnJumlah: jumlah,
      columnSelesai: selesai == true ? 1 : 0
    };
    if(id != null){
      map[columnId] = id;
    }
    return map;
  }

  DatabaseHelper();

  DatabaseHelper.fromMap(Map<String, dynamic> map){
    id = map[columnId];
    nama = map[columnNama];
    jumlah = map[columnJumlah];
    selesai = map[columnSelesai];
  }

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();


}