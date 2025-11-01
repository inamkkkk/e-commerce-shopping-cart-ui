import 'package:flutter/material.dart';
import 'package:ecommerce_cart_ui/models/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartService extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  double get total => _cartItems.fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));

  CartService() {
    // Initialize with some sample products
    _cartItems.addAll([
      CartItem(
        product: Product(
            id: 1,
            name: 'Product A',
            price: 20.0,
            imageUrl: 'https://via.placeholder.com/150'),
        quantity: 2
      ),
      CartItem(
        product: Product(
            id: 2,
            name: 'Product B',
            price: 30.0,
            imageUrl: 'https://via.placeholder.com/150'),
          quantity: 1
      ),
      CartItem(
          product: Product(
              id: 3,
              name: 'Product C',
              price: 15.0,
              imageUrl: 'https://via.placeholder.com/150'),
          quantity: 3
      )
    ]);
  }


  void increaseQuantity(Product product) {
    final existingItem = _cartItems.firstWhere((item) => item.product.id == product.id);
    existingItem.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(Product product) {
    final existingItem = _cartItems.firstWhere((item) => item.product.id == product.id);
    if (existingItem.quantity > 1) {
      existingItem.quantity--;
      notifyListeners();
    }
  }

  void addItem(Product product) {
    final existingItem = _cartItems.firstWhere((item) => item.product.id == product.id, orElse: () => CartItem(product: Product(id: 0, name: '', price: 0.0, imageUrl: '')) );

    if (existingItem.product.id != 0) {
      existingItem.quantity++;
    } else {
      _cartItems.add(CartItem(product: product));
    }

    notifyListeners();
  }

  void removeItem(Product product) {
    _cartItems.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }
}
