import 'package:app/screen/checkout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/screen/cart.dart';
import 'package:app/screen/catalog.dart';
import 'package:app/provider/shoppingcart.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoppingCart())
      ], 
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
        useMaterial3: true,
      ),
      // home: const Placeholder(),
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const Catalog());
        }
        else if (settings.name == '/cart') {
          return MaterialPageRoute(builder: (context) => const Cart());
        } else if (settings.name == '/checkout') { // Add route for the checkout screen
          return MaterialPageRoute(builder: (context) => const Checkout());
        }
      },
    );
  }
}
