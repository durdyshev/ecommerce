import 'package:ecommerce/providers/theme_provider.dart';
import 'package:ecommerce/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context){
    final themeProvider=Provider.of<ThemeProvider>(context);
    return Scaffold(
      body:Center(
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const SubtitleTextWidget(label: "Salom21",),
         ElevatedButton(onPressed: (){}, child: const Text("Hello world")),
         SwitchListTile(
          title: Text(themeProvider.getIsDarkTheme? "Dark Mode": "Light Mode"),
          value: themeProvider.getIsDarkTheme, onChanged: (value){themeProvider.setDarkTheme(value);})
    ],)
      ) );
  }

}