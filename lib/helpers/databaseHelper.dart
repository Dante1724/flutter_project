import 'dart:io';

import 'package:tugas_akhir/models/daftarBelanja.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static final _databaseName = "ShoppingNote.db";
  static final _databaseVersion = 1;

  static final table= 'shopping_list';

  static final columnId = '_id';
  static final columnNama = 'nama';
  static final columnJumlah = 'jumlah';
  static final columnStatus = 'status';
  static final columnFoto = 'foto';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async{
    if(_database != null) return database;
    _database = await _initDatabase();
    return database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnNama TEXT NOT NULL,
        $columnJumlah INTEGER NOT NULL,
        $columnStatus TEXT NOT NULL,
        $columnFoto BLOB
      )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);

  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  // Future<List<DaftarBelanja>> daftarBelanja() async {
  //   final Database db = await database;
  //   final List<Map<String, dynamic>> maps = await db.query(table);
  //
  //   return List.generate(maps.length, (i) {
  //     return DaftarBelanja(
  //       id:  maps[i]['id'],
  //       nama: maps[i]['name'],
  //       jumlah: maps[i]['jumlah'],
  //       selesai: maps[i]['selesai'],
  //       foto: maps[i]['foto'],
  //     );
  //   });
  // }

  // Future<List<Map<String, dynamic>>> daftarBelanjaMap() async {
  //   Database db = await database;
  //   final List<Map<String, dynamic>> result = await db.
  // }

  Future<List<DaftarBelanja>> daftarBelanja() async{
    final List<Map<String, dynamic>> daftarBelanjaList = await queryAllRows();
    final List<DaftarBelanja> listBelanja = [];
    daftarBelanjaList.forEach((daftarMap){
      listBelanja.add(DaftarBelanja());
    });
    
  }
}



// import 'dart:io';
//
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
// import 'package:tugas_akhir/models/daftarBelanja.dart';
//
//
// class DatabaseHelper{
//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
//
//   int id, jumlah;
//   String nama;
//   bool selesai;
//   File foto;
//   static final _dbName = 'shopping_note.db';
//   static final _dbVersion = 1;
//   static Database _database;
//   static final _tableName = 'daftar_belanja';
//   static final columnId='id';
//   static final columnNama='nama';
//   static final columnJumlah='jumlah';
//   static final columnFoto='foto';
//   static final columnSelesai='selesai';
//
//   Map<String, dynamic> toMap(){
//     var map = <String, dynamic>{
//       columnId: id,
//       columnNama: nama,
//       columnJumlah: jumlah,
//       columnFoto: foto,
//       columnSelesai: selesai == true ? 1 : 0
//     };
//     if(id != null){
//       map[columnId] = id;
//     }
//     return map;
//   }
//
//   DatabaseHelper();
//
//   DatabaseHelper.fromMap(Map<String, dynamic> map){
//     id = map[columnId];
//     nama = map[columnNama];
//     jumlah = map[columnJumlah];
//     selesai = map[columnSelesai];
//   }
//
//   Future<Database> get database async {
//     if(_database!=null) {
//       return _database;
//     } else{
//       _database = await _initiateDatabase();
//       return _database;
//     }
//   }
//
//   _initiateDatabase() async{
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = join(directory.path,_dbName);
//     await openDatabase(
//         path,
//         version: _dbVersion,
//         onCreate: _onCreate
//     );
//
//
//   }
//
//   Future _onCreate(Database db, int version){
//     db.execute(
//       '''
//       CREATE TABLE $_tableName (
//       $columnId INTEGER PRIMARY KEY,
//       $columnNama TEXT NOT NULL,
//       $columnJumlah INT NOT NULL,
//       $columnSelesai INT NOT NULL,
//       $columnFoto BLOB)
//       '''
//     );
//   }
//
//   Future<int> insert(Map<String, dynamic> row) async{
//     Database db = await instance.database;
//     return await db.insert(_tableName, row);
//   }
//
//   Future <List<Map<String, dynamic>>> queryAll() async{
//     Database db = await instance.database;
//     return await db.query (_tableName);
//   }
//
//   Future update(Map<String, dynamic> row) async{
//     Database db = await instance.database;
//     int idTarget = row[columnId];
//     return await db.update(_tableName, row, where: '$columnId = ? $columnNama = ?',whereArgs: [idTarget]);
//   }
//
//   Future<int> delete(int id) async{
//     Database db = await instance.database;
//     return await db.delete(_tableName,where: '$columnId = ?', whereArgs: [id]);
//   }
//
//
//
//
// }