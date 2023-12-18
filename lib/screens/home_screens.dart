
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisata_zoopedia/data/zoo_data.dart';
import 'package:wisata_zoopedia/models/zoo.dart';

import '../widgets/log_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 1 Buat appbar dengan judul Wisata Kebun Binatang
        appBar: AppBar(title: Text('Wisata Kebun Binatang')),
        // TODO: 2 Buat body dengan GridView.builder
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            padding: EdgeInsets.all(8.0),
            itemCount: zooList.length,
            // TODO: 3 Buat ItemCard sebagai return dari GridView.builder
            itemBuilder: (context, index) {
              Zoo zoo = zooList[index];
              return ItemCard(zoo: zoo);
            })
    );
  }
}
