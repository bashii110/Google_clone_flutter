import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_clone/search/search_results_components.dart';

import '../services/api_services.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;

   SearchScreen(
      {super.key, required this.searchQuery, required this.start});

  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Google",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {},
                child: Text(
                  "Signing",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
            ),
            // SizedBox(
            //   width: 20,
            // ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SizedBox(
                  width:
                      size.width <= 550 ? size.width * 0.93 : size.width * 0.70,
                  height: 55,
                  child: TextField(
                    onSubmitted: (query) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(
                            searchQuery: query,
                            start: "0",
                          ),
                        ),
                      );
                    },
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white70,
                      focusColor: Colors.blue,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.black54),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.black54,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset("assets/images/mic-icon.svg"),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "All",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: isActive ? Colors.blue : Colors.grey),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Images",
                      style: TextStyle(
                          fontSize: 18,
                          color: isActive ? Colors.blue : Colors.grey),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Videos",
                      style: TextStyle(
                          fontSize: 18,
                          color: isActive ? Colors.blue : Colors.grey),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "News",
                      style: TextStyle(
                          fontSize: 18,
                          color: isActive ? Colors.blue : Colors.grey),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Short Videos",
                      style: TextStyle(
                          fontSize: 18,
                          color: isActive ? Colors.blue : Colors.grey),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Web",
                      style: TextStyle(
                          fontSize: 18,
                          color: isActive ? Colors.blue : Colors.grey),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Forums",
                      style: TextStyle(
                          fontSize: 18,
                          color: isActive ? Colors.blue : Colors.grey),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "More",
                      style: TextStyle(
                          fontSize: 18,
                          color: isActive ? Colors.blue : Colors.grey),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 0.5,
              ),
              SizedBox(
                height: 3,
                child: isActive
                    ? Container(
                        height: 3,
                        width: 40,
                        color: Colors.blue,
                      )
                    : Container(),
              ),

              Container(
                color: Colors.grey,
                height: 2,
              ),

              FutureBuilder(
                future: ApiServices().fetchData(
                    queryTerm: searchQuery, start: start),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About ${snapshot.data["searchInformation"]["formattedTotalResults"]} results  (${snapshot.data["searchInformation"]["formattedSearchTime"]} seconds)",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data?['items'].length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return SearchResultsComponents(
                                link: snapshot.data?['items'][index]['formattedUrl'],
                                text: snapshot.data?['items'][index]['title'],
                                desc: snapshot.data?['items'][index]['snippet'],
                                linkToGo: snapshot.data?['items'][index]['link'],
                              );
                            },
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      if (start != "0") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SearchScreen(
                                              searchQuery: searchQuery,
                                              start:
                                                  (int.parse(start) - 10)
                                                      .toString(),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text(
                                      "<Previous",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SearchScreen(
                                            searchQuery: searchQuery,
                                            start: (int.parse(start) + 10)
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Next>",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Icon(Icons.home_outlined),
                                      Text(
                                        "Home",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.search),
                                      Text(
                                        "Search",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.notifications),
                                      Text(
                                        "Notification",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.access_time),
                                      Text(
                                        "Activity",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const Center(
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
