import 'package:flutter/material.dart';
import 'package:store_app/widgets/cartItem.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  double calculateTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        child: ListTile(
                          leading: Image.network(
                            item.image,
                            width: 60,
                            height: 60,
                            //fit: BoxFit.cover,//يكبر الصورة عشان تغطي كل المساحة حتى لو قص جزء صغير منها.
                            fit: BoxFit.contain, //يخلي الصورة كلها تبان بدون قص، حتى لو ساب فراغ حوالين الصورة.
                          ),
                          title: Text(
                            item.title.length > 15
                                ? item.title.substring(0, 15) + '...'
                                : item.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          subtitle: Text(
                            r"$" + item.price.toStringAsFixed(2),
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.redAccent),
                            onPressed: () {
                              cartItems.removeAt(index);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => CartPage()),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        r"$" + calculateTotalPrice().toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
