class MataKuliah {
  String kode;
  String nama;
  int sks;

  MataKuliah(this.kode, this.nama, this.sks);

  @override
  String toString() {
    return '$kode - $nama ($sks SKS)';
  }
}
