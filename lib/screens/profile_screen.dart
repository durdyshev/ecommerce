import 'package:ecommerce/const/image_paths.dart';
import 'package:ecommerce/widgets/app_name_text.dart';
import 'package:ecommerce/widgets/subtitle_text.dart';
import 'package:ecommerce/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:ecommerce/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(ImagePaths.shoppingCart),
          ),
          title: const AppNameTextWidget(),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Visibility(
                visible: false,
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: TitlesTextWidget(
                      label: "Please login to have unlimited access"),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).cardColor,
                            border: Border.all(color: Colors.blue, width: 3.0),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png"),
                                fit: BoxFit.fill)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitlesTextWidget(label: "Durdyshev"),
                          SizedBox(
                            height: 6,
                          ),
                          SubtitleTextWidget(
                            label: "ddurdyshev@gmail.com",
                          )
                        ],
                      )
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TitlesTextWidget(label: "General"),
                    CustomListTile(
                        imagePath: ImagePaths.orderSvg,
                        text: "All orders",
                        function: () {}),
                    CustomListTile(
                        imagePath: ImagePaths.wishlistSvg,
                        text: "Wishlist",
                        function: () {}),
                    CustomListTile(
                        imagePath: ImagePaths.recent,
                        text: "View Recently",
                        function: () {}),
                    CustomListTile(
                        imagePath: ImagePaths.address,
                        text: "Address",
                        function: () {}),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TitlesTextWidget(label: "Settings"),
                    const SizedBox(
                      height: 10,
                    ),
                    SwitchListTile(
                        secondary: Image.asset(
                          ImagePaths.theme,
                          height: 34,
                        ),
                        title: Text(themeProvider.getIsDarkTheme
                            ? "Dark Mode"
                            : "Light Mode"),
                        value: themeProvider.getIsDarkTheme,
                        onChanged: (value) {
                          themeProvider.setDarkTheme(value);
                        })
                  ],
                ),
              ),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {},
                  label: const Text("Logout"),
                  icon: const Icon(Icons.login),
                ),
              )
            ],
          ),
        ));
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.function});
  final String imagePath, text;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      title: SubtitleTextWidget(label: text),
      leading: Image.asset(
        imagePath,
        height: 30,
      ),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
