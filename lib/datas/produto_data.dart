import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  late String category;

  late String id;
  late String title;
  late String descricao;

  late double preco;

  late List images;
  late List tamanho;

  ProductData.fromDocument(DocumentSnapshot snapshot) {
    //possivel causador do erro
    id = snapshot.id;
    title = snapshot.get('title');
    descricao = snapshot.get('descricao');
    preco = snapshot.get('preco') + 0.0;
    images = snapshot.get('images');
    tamanho = snapshot.get('tamanho');
  }
}
