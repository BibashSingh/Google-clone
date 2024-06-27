import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';

class SearchTab extends StatelessWidget {
  final IconData icon;
  final bool isactive;
  final String text;
  const SearchTab(
      {super.key,
      required this.icon,
      required this.text,
      this.isactive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isactive ? blueColor : Colors.grey,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 15, color: isactive ? blueColor : Colors.grey),
            ),
           
          ],
        ),
         SizedBox(height: 7,),
         isactive?
            Container(
              height: 3,
              width: 40,
              color: blueColor,
            ):Container()
      ],
    );
  }
}
