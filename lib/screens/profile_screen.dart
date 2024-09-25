import 'package:ecommerce/const/image_paths.dart';
import 'package:ecommerce/widgets/title_text.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(ImagePaths.shoppingCart),
        ),
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          const Visibility(
            visible: false,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TitlesTextWidget(label: "Login For Unlimited Service!!!"),
            ),
          ),
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor,
                  border: Border.all(
                      color: Theme.of(context).colorScheme.surface, width: 3),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
             const Column(children: [Text("Name"),Text("Email")],)
            ],
          )
        ],
      ),
    );
  }
}
