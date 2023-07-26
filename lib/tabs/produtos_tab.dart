//erro na linha 21

import 'package:apploja/tiles/category_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProdutosTab extends StatelessWidget {
  const ProdutosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('produtos').get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var devidedTiles = ListTile.divideTiles(
                  tiles: snapshot.data!.docs.map((e) {
                    return CategoryTile(e);
                  }).toList(),
                  color: Colors.grey[500])
              .toList();

          return ListView(children: devidedTiles);
        }
      },
    );
  }
}
