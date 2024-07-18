import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mariam/business_logic/cubit/product_cubit.dart';
import 'package:mariam/model/products.dart';
import 'package:mariam/ui/widget/item_carts.dart';
import 'package:mariam/ui/widget/loadingapp.dart';

class ProductsCarts extends StatefulWidget {
  const ProductsCarts({super.key});

  @override
  State<ProductsCarts> createState() => _ProductsCartsState();
}

class _ProductsCartsState extends State<ProductsCarts> {
  late List<Products> allProduct;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductCubit>(context).getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if (state is ProductLoaded) {
        allProduct = (state).product;
        return buildItemProductCarts();
      } else {
        return const LoadingApp();
      }
    });
  }

  Widget buildItemProductCarts() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [buildItemCartsLst()],
        ),
      ),
    );
  }

  Widget buildItemCartsLst() {
    return Column(
      children: [
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 10),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: allProduct.length,
            itemBuilder: (context, index) {
              return ItemCarts(
                product: allProduct[index],
              );
            }),
      ],
    );
  }
}
