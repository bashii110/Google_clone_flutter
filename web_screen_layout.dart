import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../search/search_screen.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({super.key});

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  get searchQuery => "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text("Google Clone"),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Gmail",
                style: TextStyle(fontWeight: FontWeight.w400),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                "Images",
                style: TextStyle(fontWeight: FontWeight.w400),
              )),
          IconButton(
            onPressed: () {},
            // color: Colors.white,
            icon: SvgPicture.asset(
              "assets/images/more-apps.svg",
              color: Color(0xFFFFFFFF),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: Text(
                "Signin",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset(
              "assets/images/google-logo.png",
              height: MediaQuery.of(context).size.height * 0.12,
            ),

            SizedBox(
              height: 10,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.height * 0.7,
              height: 45,
              child: TextFormField(
                onFieldSubmitted: (query){
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
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white70,
                  focusColor: Colors.blue,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: "Search Google or Type a URL",
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


            SizedBox(
              height: 10,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {

                    }, 
                    child: Text("Google Search")),
                SizedBox(
                  width: 30,
                ),
                TextButton(onPressed: () {}, child: Text("I'm feeling lucky"),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
