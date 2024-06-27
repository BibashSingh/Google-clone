import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/widgets/mobile/mobile_footer.dart';
import 'package:google_clone/widgets/search.dart';
import 'package:google_clone/widgets/translation_button.dart';
import 'package:google_clone/widgets/web.dart';
import 'package:google_clone/widgets/web/web_footer.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.grey,
            )),
        title: SizedBox(
          width: size.width * 0.34,
          child: DefaultTabController(
              length: 2,
              child: TabBar(
                  labelColor: blueColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: blueColor,
                  tabs: [
                    Tab(
                      text: "ALL",
                    ),
                    Tab(
                      text: "IMAGES",
                    ),
                  ])),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/more-apps.svg',
                color: primaryColor,
              )),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10).copyWith(
              right: 10,
            ),
            child: MaterialButton(
              onPressed: () {},
              color: Color(0xff1A73EB),
              child: Text(
                "Sign in",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.25),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Search(),
                    
                  ],
                ),
                const MobileFooter(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
