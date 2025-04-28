import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/cartPage.dart';
import 'package:store_app/services/get_all_product.dart';
import 'package:store_app/widgets/customCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = "homePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            icon: Icon(FontAwesomeIcons.cartPlus, color: Colors.black),
          ),
        ],
        backgroundColor: Colors.white,
        // elevation: 0,
        centerTitle: true,
        title: Text("New Trend", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 70),

        child: FutureBuilder<List<ProductModel>>(
          future: AllProductService().getAllProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> product = snapshot.data!;
              return GridView.builder(
                itemCount: product.length,
                clipBehavior: Clip.none, //عايز اسمع ليها شرح
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //عدد العناصر في كل صف
                  childAspectRatio:
                      1.35, //يتحكم في طول وعرض العنصر(في تسبه الطول للعرض)
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(product: product[index]);
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

