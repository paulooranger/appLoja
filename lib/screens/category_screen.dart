import 'package:apploja/datas/produto_data.dart';
import 'package:apploja/tiles/product_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;
  const CategoryScreen(this.snapshot, {super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(snapshot.get('title')),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          bottom: const TabBar(
            physics: NeverScrollableScrollPhysics(),
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.grid_on),
              ),
              Tab(
                icon: Icon(Icons.list),
              )
            ],
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('produtos')
                .doc(snapshot.id)
                .collection('itens')
                .get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    GridView.builder(
                      padding: const EdgeInsets.all(4),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              childAspectRatio: 0.65),
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        return ProductTile(
                          'grid',

                          //erro ocorendo na linha abaixo
                          ProductData.fromDocument(snapshot.data!.docs[index]),
                        );
                      },
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.all(4),
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        return ProductTile(
                          'list',
                          ProductData.fromDocument(snapshot.data!.docs[index]),
                        );
                      },
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
