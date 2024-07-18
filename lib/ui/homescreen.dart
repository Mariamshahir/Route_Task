import 'package:flutter/material.dart';
import 'package:mariam/ui/widget/product_carts.dart';
import 'package:mariam/ui/widget/search_article.dart';
import 'package:mariam/utils/assets_app.dart';
import 'package:mariam/utils/colors_app.dart';
import 'package:mariam/utils/theme_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchTextController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: Column(
          children: [
            Builder(
              builder: (BuildContext context) {
                return Image.asset(
                  AppAssets.logo,
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.05,
                );
              },
            ),
          ],
        ),
        title: TextField(
          controller: searchTextController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
            // Adjust the padding as needed
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: AppColor.primary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: AppColor.primary),
            ),
            prefixIcon:
            const Icon(Icons.search, size: 30, color: AppColor.primary),
            hintText: "What do you search for?",
            hintStyle: AppTheme.search,
          ),
          style: AppTheme.search,
          onTap: () {
            showSearch(context: context, delegate: SearchArticle());
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColor.primary,
              size: 30,
            ),
          ),
        ],
      ),
      body: const ProductsCarts(),
    );
  }
}