class DaftarBelanja {
  int id;
  String nama;
  int jumlah;
  bool selesai = false;


  DaftarBelanja({this.id, this.nama, this.jumlah, this.selesai});

  Map<String, dynamic> toMap(){
    final map = Map<String, dynamic>();
    map['nama'] = nama;
    map['jumlah'] = jumlah;
    map['selesai'] = selesai == true ? 1 : 0;
    if(id != null){
      map['id'] = id;
    }
    return map;
  }
}