import 'package:flutter/material.dart';
import 'package:wisata_zoopedia/data/zoo_data.dart';
import 'package:wisata_zoopedia/models/zoo.dart';
import 'package:wisata_zoopedia/screens/detail_screens.dart';

import 'detail_screens.dart'; // TODO: 9. Import DetailScreen

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // TODO: 1. Deklarasikan variabel yang dibutuhkan
  List<Zoo> _filteredZoo = zooList;
  final String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  List<Zoo> _filterZooByQuery(String query) {
    return zooList
        .where((zoo) =>
    zoo.nama.toLowerCase().contains(query.toLowerCase()) ||
        zoo.lokasi.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Buat appbar dengan judul Pencarian Zoo
      appBar: AppBar(
        title: const Text('Cari Destinasi: Kebun Binatang'),
      ),
      // TODO: 3. Buat body berupa Column
      body: Column(
        children: [
          // TODO: 4. Buat TextField pencarian sebagai anak dari Column
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.lightGreen[50],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (query) {
                  setState(() {
                    // Tidak perlu lagi mengubah _searchQuery
                    _filteredZoo = _filterZooByQuery(query);
                  });
                },

                // TODO: 6. Implementasi fitur pencarian
                decoration: InputDecoration(
                  hintText: 'Ketik nama atau lokasi kebun binatang...',
                  prefixIcon: const Icon(Icons.search),
                  // TODO: 7. Implementasi pengosongan input
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreen),
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),
          // TODO: 5. Buat ListView hasil pencarian sebagai anak dari Column
          Expanded(
            child: ListView.builder(
              itemCount: _filteredZoo.length,
              itemBuilder: (_, index) {
                final zoo = _filteredZoo[index];


                // TODO: 8. Implementasi GestureDetector dan Hero animation
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(zoo: zoo), // TODO: 10. Kirim objek Zoo ke DetailScreen
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              zoo.imageAsset,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                zoo.nama,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(zoo.lokasi),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
