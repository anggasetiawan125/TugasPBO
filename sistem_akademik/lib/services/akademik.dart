import '../models/nilai.dart';
import '../models/krs.dart';
import '../models/mhs.dart';
import '../models/matkul.dart';
import '../services/akademik.dart';

class AkademikService {
  List<Nilai> daftarNilai = [];

  void inputNilai(KRS krs, MataKuliah mataKuliah, double nilai) {
    Nilai n = Nilai(mataKuliah, nilai);
    daftarNilai.add(n);
    print('Nilai untuk ${mataKuliah.nama} berhasil diinput: $nilai');
  }

  double hitungIPK(KRS krs) {
    double totalNilai = 0;
    int totalSKS = 0;

    for (var mk in krs.daftarMataKuliah) {
      var nilai = daftarNilai
          .firstWhere((n) => n.mataKuliah == mk, orElse: () => Nilai(mk, 0))
          .nilai;
      totalNilai += nilai * mk.sks;
      totalSKS += mk.sks;
    }

    return totalSKS > 0 ? totalNilai / totalSKS : 0;
  }

  void cetakTranskrip(KRS krs) {
    print('Transkrip Nilai ${krs.mahasiswa.nama}');
    for (var mk in krs.daftarMataKuliah) {
      var nilai = daftarNilai
          .firstWhere((n) => n.mataKuliah == mk, orElse: () => Nilai(mk, 0))
          .nilai;
      print('${mk.nama} - Nilai: $nilai');
    }
    print('IPK: ${hitungIPK(krs)}');
  }
}
