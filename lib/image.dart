final imageCategories = ['Naruto', 'Seven deadly sins', 'Dragon Ball Super'];

class AnimeImage {
  final int id;
  final String category;
  final String source;

  AnimeImage({ this.id, this.category, this.source });

}

final String baseAssets = 'assets/images';

List<AnimeImage> images = [
  AnimeImage(id: 1, category: imageCategories[0], source: "$baseAssets/naruto/1.jpg"),
  AnimeImage(id: 2, category: imageCategories[0], source: "$baseAssets/naruto/2.jpg"),
  AnimeImage(id: 3, category: imageCategories[0], source: "$baseAssets/naruto/3.jpg"),
  AnimeImage(id: 4, category: imageCategories[0], source: "$baseAssets/naruto/4.jpg"),
  AnimeImage(id: 5, category: imageCategories[1], source: "$baseAssets/seven/1.jpg"),
  AnimeImage(id: 6, category: imageCategories[1], source: "$baseAssets/seven/2.jpg"),
  AnimeImage(id: 7, category: imageCategories[1], source: "$baseAssets/seven/3.jpg"),
  AnimeImage(id: 8, category: imageCategories[1], source: "$baseAssets/seven/4.jpg"),
  AnimeImage(id: 9, category: imageCategories[1], source: "$baseAssets/seven/5.jpg"),
  AnimeImage(id: 10, category: imageCategories[1], source: "$baseAssets/seven/6.jpg"),
  AnimeImage(id: 11, category: imageCategories[1], source: "$baseAssets/seven/7.jpg"),
  AnimeImage(id: 12, category: imageCategories[1], source: "$baseAssets/seven/8.png"),
  AnimeImage(id: 13, category: imageCategories[2], source: "$baseAssets/db/goku.jpg"),
  AnimeImage(id: 14, category: imageCategories[2], source: "$baseAssets/db/vegeta.jpg"),
  AnimeImage(id: 15, category: imageCategories[2], source: "$baseAssets/db/1.jpg"),
  AnimeImage(id: 16, category: imageCategories[2], source: "$baseAssets/db/2.jpg"),
  AnimeImage(id: 17, category: imageCategories[2], source: "$baseAssets/db/3.jpg"),
];

Future<List<AnimeImage>> getImagesByCategory(String category) async {
  return images.where((image) => image.category == category).toList();
}