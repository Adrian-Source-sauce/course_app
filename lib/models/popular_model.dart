class PopularModel {
  final String name;
  final String imageUrl;
  final String price;
  final String rating;

  PopularModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });

  static List<PopularModel> getPopular() {
    List<PopularModel> populars = [];
    populars.add(PopularModel(
        name: "UI Design : Wireframe\nto Visual Design",
        imageUrl: "assets/images/Image1.jpg",
        price: "Free",
        rating: "4.5"));
    populars.add(PopularModel(
        name: "UI Design : Styleguide\nwith figma",
        imageUrl: "assets/images/Image.png",
        price: "Free",
        rating: "4.5"));
    return populars;
  }
}
