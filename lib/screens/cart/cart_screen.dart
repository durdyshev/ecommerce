import 'package:ecommerce/screens/cart/cart_widget.dart';
import 'package:ecommerce/screens/empty_bag.dart';
import 'package:ecommerce/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/const/image_paths.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyBag(
                imagePath: ImagePaths.shoppingBasket,
                title: "Your cart is empty",
                subtitle:
                    "Looks like your cart is empty add something to make me happy :)",
                buttonText: "Shop Now"))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(ImagePaths.shoppingCart),
              ),
              title: const TitlesTextWidget(
                label: "Cart (6)",
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete_forever_rounded,
                        color: Colors.red)),
              ],
            ),
            body: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CartWidget();
                }),
          );
  }
}
