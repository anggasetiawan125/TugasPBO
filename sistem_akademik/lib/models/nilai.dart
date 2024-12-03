import 'matkul.dart';

class Nilai {
  MataKuliah mataKuliah;
  double nilai;

  Nilai(this.mataKuliah, this.nilai);

  @override
  String toString() {
    return '${mataKuliah.nama}: $nilai';
  }
}
