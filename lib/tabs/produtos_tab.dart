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
        if (snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              return CategoryTile(doc);
            }).toList(),
          );
        }
      },
    );
  }
}
