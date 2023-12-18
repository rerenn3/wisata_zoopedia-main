class Zoo {
  final String nama;
  final String lokasi;
  final String deskripsi;
  final String dibangun;
  final String luas;
  final String imageAsset;
  final List<String> imageUrls;
  bool isFavorite;

  Zoo({
    required this.nama,
    required this.lokasi,
    required this.deskripsi,
    required this.dibangun,
    required this.luas,
    required this.imageAsset,
    required this.imageUrls,
    this.isFavorite = false,
  });

}

