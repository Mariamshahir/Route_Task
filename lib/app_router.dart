import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mariam/business_logic/cubit/product_cubit.dart';
import 'package:mariam/data/api_manger.dart';
import 'package:mariam/repository/products_repository.dart';
import 'package:mariam/ui/homescreen.dart';

class AppRouter {
  late ProductsRepository productsRepository;
  late ProductCubit productCubit;

  AppRouter() {
    productsRepository = ProductsRepository(ApiManager());
    productCubit = ProductCubit(productsRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => productCubit,
            child: HomeScreen(),
          ),
        );
    }
  }
}
