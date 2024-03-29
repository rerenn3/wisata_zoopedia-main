import 'package:flutter/material.dart';
import 'package:wisata_zoopedia/data/zoo_data.dart';
import 'package:wisata_zoopedia/models/zoo.dart';

import 'detail_screens.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key});

  // Buat daftar untuk menyimpan item favorit
  static List<Zoo> favoriteList = [];

  // Metode untuk menambahkan item favorit
  static void addFavorite(Zoo zoo) {
    favoriteList.add(zoo);
    // Perbarui tampilan ketika item favorit ditambahkan
    if (onFavoriteUpdated != null) {
      onFavoriteUpdated!();
      print('Favorite added. Callback called.');
    }
  }

  // Metode untuk menghapus item favorit
  static void removeFavorite(Zoo zoo) {
    favoriteList.remove(zoo);
    // Perbarui tampilan ketika item favorit dihapus
    if (onFavoriteUpdated != null) {
      onFavoriteUpdated!();
      print('Favorite removed. Callback called.');
    }
  }
  // Callback untuk memperbarui tampilan
  static void Function()? onFavoriteUpdated;



  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}



class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    // Dapatkan daftar wisata yang sudah difavoritkan
    List<Zoo> favoriteZoo = FavoriteScreen.favoriteList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Zoo'),
      ),
      body: favoriteZoo.isEmpty
          ? Center(
        child: Text(
          'Belum ada wisata yang difavoritkan.',
          style: TextStyle(fontSize: 16),
        ),
      )
          : ListView.builder(
        itemCount: favoriteZoo.length,
        itemBuilder: (context, index) {
          final zoo = favoriteZoo[index];
          return Card(
            margin:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(zoo.imageAsset),
              ),
              title: Text(zoo.nama),
              subtitle: Text(zoo.lokasi),
              onTap: () {
                // Implementasi aksi ketika item ditekann
                // Misalnya, navigasi ke halaman detail
                print('Selected Zoo: ${zoo.nama}'); // Cetak nilai zoo sebelum navigasii
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => DetailScreen(zoo: zoo),
                    ),
                );
              }
            ),
          );
        },
      ),
    );
  }
}