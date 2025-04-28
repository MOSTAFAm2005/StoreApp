import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/ProductDetailsPage.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({required this.product, super.key});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ProductDetailsPage(product: product),
        //   ),
        // );
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(
              milliseconds: 4000,
            ), // خليها مثلا اي رقم اكبرms بدلا من 300ms الطبيعي
            pageBuilder:
                (context, animation, secondaryAnimation) =>
                    ProductDetailsPage(product: product),
          ),
        );
      },
      child: Stack(
        //الستاك بتستخدم لوضع ويدجدز فوق بعض
        clipBehavior: Clip.none,
        children: [
          Container(
            // height: 130,
            // width: 220, //شيلتهم عشان الي هيتحكم فيهم هوه childAspectRatio
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 40, //ده بيبقي فيه الحديه بتاعت الشادو
                  color: Colors.grey.shade300,
                  spreadRadius: 0, //فيه الامتداد بتاع الشادو
                  offset: Offset(10, 10), //مقدار الامتداد افقي وراسي
                ),
              ],
            ),
            child: Card(
              color: Colors.white,
              elevation: 10,
              // color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.split(' ').take(2).join(" "),
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r"$" + product.price.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.favorite, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            //تستخدم لتحريك الويدجد جوه الستاك
            right: 32,
            top: -65,
            child: Hero(
              tag: product.id, // أو ممكن تستخدم product.title لو حابب
              child: Image.network(product.image, height: 115, width: 100),
            ),

            // child: Image.network(
            //   product.image,
            //   // 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
            //   height: 115,
            //   width: 100,
            // ),
          ),
        ],
      ),
    );
  }
}
