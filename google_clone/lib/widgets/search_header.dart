import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/screens/search_screen.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 28, right: 15, top: 4),
            child: Image.asset(
              "assets/images/google-logo.png",
              height: 30,
              width: 92,
            ),
          ),
          SizedBox(
            width: 27,
          ),
          Container(
            height: 44,
            width: size.width * 0.45,
            decoration: BoxDecoration(
                color: searchColor,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: searchColor)),
            child: TextFormField(
            onFieldSubmitted: (query){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SearchScreen(searchQuery: query, start: '0'),),);
            },
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 150),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/images/mic-icon.svg',
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.search,
                          color: blueColor,
                        )
                      ],
                    ),
                  ),
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none
              ),
            ),
          ),
        ],
      ),
    );
  }
}
