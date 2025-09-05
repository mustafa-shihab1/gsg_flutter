import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gsg_flutter/data/product_model.dart';
import 'package:gsg_flutter/views/product_view.dart';
import 'package:http/http.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  final List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProductView(productModel: products);
                },
              ),
            );
          },
          child: Text('Fetch Data'),
        ),
      ),
    );
  }

  void fetchData() async {
    var response = await get(Uri.parse('https://fakestoreapi.com/products'));
    log(response.body);
    var data = jsonDecode(response.body);
    for (var element in data) {
      setState(() {
        products.add(ProductModel.fromJson(element));
      });
    }
  }
}
