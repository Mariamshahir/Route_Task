import 'package:bloc/bloc.dart';
import 'package:mariam/model/products.dart';
import 'package:mariam/repository/products_repository.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductsRepository productsRepository;
  late List<Products> products=[];

  ProductCubit(this.productsRepository) : super(ProductInitial()) {
    products = []; // Initialize the products list here
  }

  List<Products> getAllProduct() {
    productsRepository.loadingProducts().then((products) {
      emit(ProductLoaded(products));
      this.products = products;
    });
    return products;
  }
}