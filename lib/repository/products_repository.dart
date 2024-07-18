import 'package:mariam/data/api_manger.dart';
import 'package:mariam/model/products.dart';


class ProductsRepository {
  final ApiManager apiManager;

  ProductsRepository(this.apiManager);

  Future<List<Products>> loadingProducts() async {
    final products = await apiManager.loadingProducts();
    return products.map((product) => Products.fromJson(product)).toList();
  }
}
