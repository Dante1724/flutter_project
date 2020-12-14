import 'dart:io';

class DaftarBelanja {
  int id;
  String nama;
  int jumlah;
  int selesai = 0;
  File foto;


  DaftarBelanja({this.id, this.nama, this.jumlah, this.selesai, this.foto});

  Map<String, dynamic> toMap(){
    final map = Map<String, dynamic>();
    map['nama'] = nama;
    map['jumlah'] = jumlah;
    map['selesai'] = selesai == true ? 1 : 0;
    map['foto'] = foto;
    if(id != null){
      map['id'] = id;
    }
    return map;
  }
}