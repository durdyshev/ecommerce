import 'package:ecommerce/widgets/subtitle_text.dart';
import 'package:ecommerce/widgets/title_text.dart';
import 'package:flutter/material.dart';

class EmptyBag extends StatelessWidget {
  const EmptyBag(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.buttonText});
  final String imagePath, title, subtitle, buttonText;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image.asset(
              imagePath,
              width: double.infinity,
              height: size.height * 0.35,
            ),
            const SizedBox(height: 20),
            TitlesTextWidget(
              label: "Whoops!",
              fontSize: 40,
              color: Colors.red,
            ),
            SizedBox(height: 20),
            SubtitleTextWidget(
              label: title,
              fontWeight: FontWeight.w600,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: SubtitleTextWidget(
                label: subtitle,
                fontWeight: FontWeight.w400,
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.red,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                onPressed: () {},
                child: Text(
                  buttonText,
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
