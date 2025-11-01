import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_cart_ui/screens/cart_screen.dart';
import 'package:ecommerce_cart_ui/services/cart_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => CartService(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CartScreen(),
    );
  }
}
