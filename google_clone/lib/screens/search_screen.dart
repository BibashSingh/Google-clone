import 'package:flutter/material.dart';
import 'package:google_clone/Services/api_service.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/widgets/search_footer.dart';
import 'package:google_clone/widgets/search_header.dart';
import 'package:google_clone/widgets/search_result_component.dart';
import 'package:google_clone/widgets/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen(
      {super.key, required this.searchQuery, required this.start});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Title(
      color: blueColor,
      title: searchQuery,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchHeader(),
              Padding(
                padding: EdgeInsets.only(left: size.width <= 760 ? 10 : 150),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, child: SearchTabs()),
              ),
              Divider(
                height: 0,
                thickness: 0.3,
              ),
              FutureBuilder(
                future: ApiService()
                    .fetchData(queryTerm: searchQuery, start: start),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                     
                        Column(
                          children: [
                            ListView.builder(
                                itemCount: snapshot.data?['items'].length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width <= 760 ? 10 : 150,
                                            top: 10),
                                        child: SearchResultComponent(
                                            link: snapshot.data?['items'][index]
                                                ['link'],
                                            text: snapshot.data?['items'][index]
                                                ['title'],
                                            linktoGo: snapshot.data?['items'][index]
                                                ['formattedUrl'],
                                            description: snapshot.data?['items'][index]
                                                ['snippet']),
                                      ),
                                    ],
                                  );
                                }),
                                
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  if (start != 0) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => SearchScreen(
                                          searchQuery: searchQuery,
                                          start: (int.parse(start) - 10)
                                              .toString(),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  "< Prev",
                                  style:
                                      TextStyle(fontSize: 15, color: blueColor),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              TextButton(
                                onPressed: () {
                                  if (start != 0) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => SearchScreen(
                                          searchQuery: searchQuery,
                                          start: (int.parse(start) + 10)
                                              .toString(),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  "Next >",
                                  style:
                                      TextStyle(fontSize: 15, color: blueColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        const SearchFooter(),
                          ],
                        ),
                      ],
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
