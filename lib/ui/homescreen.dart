import 'package:flutter/material.dart';
import 'package:mariam/ui/widget/product_carts.dart';
import 'package:mariam/utils/assets_app.dart';
import 'package:mariam/utils/colors_app.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "homescreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Column(
          children: [
            Builder(
              builder: (BuildContext context) {
                return Image.asset(
                  AppAssets.logo,
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.03,
                ); // Using the AssetImage with Image.asset
              },
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                //showSearch(context: context, delegate: SearchArticle());
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: AppColor.primary,
                size: 30,
              ))
        ],
      ),
      body:  const ProductsCarts(),
    );
  }
}
