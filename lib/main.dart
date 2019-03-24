import 'package:flutter/material.dart';
import 'package:animated_slider/image.dart';

void main() => runApp(App());


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final ctrl = new PageController(viewportFraction: 0.8);
  int currentPage = 0;
  String currentAnimeCategory = '';
  List<AnimeImage> animeImages = [];

  @override
  void initState() {
    super.initState();
    currentAnimeCategory = imageCategories[0];
     getImagesByCategory(currentAnimeCategory).then(
             (list) => {
                setState(() {
                  animeImages = list;
                })
             });
     ctrl.addListener((){
        int nextPage = ctrl.page.round();
        if(currentPage != nextPage) {
          setState(() {
            currentPage = nextPage;
          });
        }
     });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageView.builder(
        controller: ctrl,
        itemCount: animeImages.length + 1,// +1 for addicional page
        itemBuilder: (context, index) {
          if (index == 0) {// categories page
            return buildCategoriesPage();
          }
          if (animeImages.length >= index) {// active page
            bool isActive = index == currentPage;
            return buildStoryPage(animeImages[index - 1], isActive);
          }
        },
      )
    );
  }
}

Widget buildCategoriesPage() {
  return Container(child: Text('Page 1'));
}

Widget buildStoryPage(AnimeImage list, bool isActive) {
  return Container(child: Text('Cotent'));
}