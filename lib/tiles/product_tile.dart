import 'package:apploja/datas/produto_data.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final ProductData produtc;

  const ProductTile(this.type, this.produtc, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
            child: type == "grid"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: 0.8,
                        child: Image.network(
                          produtc.images[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsetsDirectional.all(8),
                          child: Column(
                            children: <Widget>[
                              Text(
                                produtc.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'R\$ ${produtc.preco.toStringAsFixed(2)} ',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : const Row()));
  }
}
