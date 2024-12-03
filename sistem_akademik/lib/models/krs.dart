import 'mhs.dart';
import 'matkul.dart';

class KRS {
  Mahasiswa mahasiswa;
  List<MataKuliah> daftarMataKuliah = [];

  KRS(this.mahasiswa);

  void tambahMataKuliah(MataKuliah mataKuliah) {
    daftarMataKuliah.add(mataKuliah);
  }

  void cetakKRS() {
    print('KRS Mahasiswa: ${mahasiswa.nama}');
    daftarMataKuliah.forEach((mk) {
      print(mk);
    });
  }
}
