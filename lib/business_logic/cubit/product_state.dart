part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Products> product;

  ProductLoaded(this.product);
}
