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
    _getImages(imageCategories[0]);
     ctrl.addListener((){
        int nextPage = ctrl.page.round();
        if(currentPage != nextPage) {
          setState(() {
            currentPage = nextPage;
          });
        }
     });
  }

  _getImages(String category) {
    getImagesByCategory(category)
        .then(
            (list) => {
              setState(() {
                animeImages = list;
                currentAnimeCategory = category;
              })
            }
        );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: PageView.builder(
            controller: ctrl,
            itemCount: animeImages.length + 1,// +1 for addicional page
            itemBuilder: (context, index) {
              if (index == 0) {// categories page
                return buildCategoriesPage(currentAnimeCategory, _getImages);
              }
              if (animeImages.length >= index) {// active page
                bool isActive = index == currentPage;
                return buildStoryPage(animeImages[index - 1], isActive);
              }
            },
          ),
        ),
      )
    );
  }
}

Widget buildCategoriesPage(String activeCategory, Function onSelectCategory) {
  List<Widget> children = [
    Text(
      "Category",
      style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 32.0,
          fontWeight: FontWeight.bold
      ),
    )
  ];

  for (String name in imageCategories) {
    children.add(
        FlatButton(
          child: Text("#$name"),
          color: activeCategory == name ? Colors.lightBlueAccent : Colors.white,
          onPressed: () {
            onSelectCategory(name);
          },
        )
    );
  }

  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    )
  );
}

Widget buildStoryPage(AnimeImage item, bool isActive) {
  // properties to animate
  final double blur = isActive ? 30 : 0;
  final double offset = isActive ? 10 : 0;
  final double top = isActive ? 100 : 200;
  final double opacity = isActive ? 1.0 : 0.5;
  return AnimatedOpacity(
    duration: Duration(milliseconds: 200),
    curve: Curves.bounceIn,
    opacity: opacity,
    child: AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutQuad,
      margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(item.source)
        ),
        boxShadow: [
          BoxShadow(color: Colors.black87, blurRadius: blur, offset: Offset(offset, offset))
        ],

      ),
    )
  );
}