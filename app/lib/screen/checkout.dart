import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/provider/shoppingcart.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Center(
        child: Consumer<ShoppingCart>(
          builder: (context, prov, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: prov.cart.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.star),
                        title: Text(prov.cart[index].name),
                        subtitle: Text('Price: ${prov.cart[index].price}'),
                      );
                    }
                  )
                ),
                createTotal(prov),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implement your checkout logic here
                    // You can clear the cart and show a success message
                    prov.removeAll();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Checkout Successful'))
                    );
                  },
                  child: Text('Confirm Checkout'),
                ),
              ],
            );
          },
        )
      )
    );
  }

  Widget createTotal(prov) {
    return Text('Total Cost: ${prov.getTotal()}');
  }
}
