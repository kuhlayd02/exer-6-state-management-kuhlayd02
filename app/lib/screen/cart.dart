import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/provider/shoppingcart.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Consumer<ShoppingCart>(
          builder: (context, cart, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.cart.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.star),
                        title: Text(cart.cart[index].name),
                        trailing: TextButton(
                          child: const Text('Remove'),
                          onPressed: () {
                            cart.removeItem(cart.cart[index]);
                          },
                        ),
                      );
                    },
                  ),
                ),
                createTotal(cart),
                createResetButton(cart),
                const SizedBox(height: 20), // Add some space between the buttons
                ElevatedButton(
                  // Add the checkout button
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: const Text('Checkout'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget createTotal(cart) {
    return Text('Total Cost: ${cart.getTotal()}');
  }

  Widget createResetButton(cart) {
    return TextButton(
      child: const Text('RESET'),
      onPressed: () {
        cart.removeAll();
      },
    );
  }
}
