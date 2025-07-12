import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResultsComponents extends StatefulWidget {
  final String link;
  final String linkToGo;
  final String text;
  final String desc;


  const SearchResultsComponents(
      {super.key,
      required this.link,
      required this.linkToGo,
      required this.desc,
      required this.text,

      });

  @override
  State<SearchResultsComponents> createState() =>
      _SearchResultsComponentsState();
}

class _SearchResultsComponentsState extends State<SearchResultsComponents> {
  bool _showUnderline = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [




        Padding(
          padding: const EdgeInsets.only(bottom: 8),
            child: InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                final Uri url = Uri.parse(widget.linkToGo);

                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch ${widget.linkToGo}';
                }
              },
              onHover: (hovering) {
                setState(() {
                  _showUnderline = hovering;
                });
              },


                  child: Column(
                    children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                widget.link,
                                style: TextStyle(fontSize: 14, color: Colors.white70),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                widget.text,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue,
                                    decoration: _showUnderline
                                        ? TextDecoration.underline
                                        : TextDecoration.none),
                              ),
                              Text(
                                widget.desc,
                                style: TextStyle(fontSize: 10, color: Colors.white70),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),


                    ],
                  ),
            ),
        ),


      ],
    );
  }
}
