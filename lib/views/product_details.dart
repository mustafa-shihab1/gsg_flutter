import 'package:flutter/material.dart';

import '../data/product_model.dart';
import '../widgets/custom_arrow_back.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'productImage-${productModel.id}',
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.network(productModel.image!, fit: BoxFit.contain),
            ),
          ),
          CustomArrowBack(),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            maxChildSize: 1.0,
            minChildSize: 0.6,
            builder: (context, scrollController) {
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 25),
                        child: Center(
                          child: Container(
                            height: 5,
                            width: 35,
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              productModel.title!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                productModel.rating!.rate.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 4),

                              Icon(Icons.star, color: Colors.deepPurpleAccent),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        productModel.description!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
