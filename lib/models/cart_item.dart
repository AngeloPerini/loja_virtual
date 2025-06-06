import 'package:loja_virtual_mind/models/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get totalPrice => product.isOnSale
      ? product.discountedPrice! * quantity
      : product.originalPrice * quantity;
}