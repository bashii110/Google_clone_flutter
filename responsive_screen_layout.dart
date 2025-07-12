import 'package:flutter/cupertino.dart';


class ResponsiveScreenLayout extends StatelessWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;

  const ResponsiveScreenLayout(
      {
        super.key,
        required this.mobileScreenLayout,
        required this.webScreenLayout
      }
      );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth <= 768){
         return mobileScreenLayout;
      }
         return webScreenLayout;
    });
  }
}
