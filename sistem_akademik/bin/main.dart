import 'dart:io';
import '../lib/models/mhs.dart';
import '../lib/models/matkul.dart';
import '../lib/models/krs.dart';
import '../lib/services/akademik.dart';

void main() {
  // Input data Mahasiswa
  stdout.write('Masukkan NIM Mahasiswa: ');
  String nim = stdin.readLineSync()!;
  stdout.write('Masukkan Nama Mahasiswa: ');
  String nama = stdin.readLineSync()!;
  stdout.write('Masukkan Semester Mahasiswa: ');
  int semester = int.parse(stdin.readLineSync()!);

  var mahasiswa = Mahasiswa(nim, nama, semester);

  // Input MataKuliah
  List<MataKuliah> mataKuliahList = [];
  while (true) {
    stdout.write('Masukkan Kode Mata Kuliah: ');
    String kode = stdin.readLineSync()!;
    stdout.write('Masukkan Nama Mata Kuliah: ');
    String matkulNama = stdin.readLineSync()!;
    stdout.write('Masukkan SKS Mata Kuliah: ');
    int sks = int.parse(stdin.readLineSync()!);

    MataKuliah mataKuliah = MataKuliah(kode, matkulNama, sks);
    mataKuliahList.add(mataKuliah);

    stdout.write('Apakah Anda ingin menambahkan mata kuliah lain? (y/n): ');
    String? lanjut = stdin.readLineSync();
    if (lanjut?.toLowerCase() != 'y') {
      break;
    }
  }

  // Create KRS dan tambah mata kuliah
  var krs = KRS(mahasiswa);
  for (var mk in mataKuliahList) {
    krs.tambahMataKuliah(mk);
  }

  // Input Nilai
  var akademikService = AkademikService();
  for (var mk in mataKuliahList) {
    stdout.write('Masukkan nilai untuk ${mk.nama}: ');
    double nilai = double.parse(stdin.readLineSync()!);
    akademikService.inputNilai(krs, mk, nilai);
  }

  // Cetak KRS
  print('\nKRS Mahasiswa:');
  krs.cetakKRS();

  // Cetak Transkrip Nilai
  print('\nTranskrip Nilai Mahasiswa:');
  akademikService.cetakTranskrip(krs);
}
