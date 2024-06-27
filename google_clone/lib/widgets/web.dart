import 'package:flutter/material.dart';
import 'package:google_clone/widgets/web/search_button.dart';
class SeachButtons extends StatelessWidget {
  const SeachButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
               SearchButton(title: "Google Search"),
               SizedBox(width: 10,),
               SearchButton(title: "I'm feeling lucky"),

        ],
        )
      ],
    );
  }
}