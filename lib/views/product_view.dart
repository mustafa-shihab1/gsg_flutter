import 'package:flutter/material.dart';
import 'package:gsg_flutter/data/product_model.dart';

import 'product_details.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key, required this.productModel});

  final List<ProductModel> productModel;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products (${widget.productModel.length})')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: widget.productModel.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        productModel: widget.productModel[index],
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Hero(
                      tag: 'productImage-${widget.productModel[index].id}',
                      child: Image.network(
                        widget.productModel[index].image!,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '${widget.productModel[index].title}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
