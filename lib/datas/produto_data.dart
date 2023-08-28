import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  late String category;

  late String id;
  late String title;
  late String descricao;

  late double preco;

  late List imagens;
  late List tamanho;

  ProductData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.id;
    title = snapshot.get('title');
    descricao = snapshot.get('descricao');
    preco = snapshot.get('preco') + 0.0;
    imagens = snapshot.get('imagens');
    tamanho = snapshot.get('tamanho');
  }
}
