

class CategoryModel {
  final String name;
  final String course;
  final String image;

  CategoryModel({required this.name,required this.course ,required this.image});


  static List<CategoryModel> getCategory() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: "Art", 
        course: "10 Courses", 
        image: "assets/images/icon_art.jpg")
        );
    categories.add(
      CategoryModel(
        name: "Soft Skill", 
        course: "10 Courses", 
        image: "assets/images/icon_softskill.jpg")
        );
    categories.add(
      CategoryModel(
        name: "Design", 
        course: "10 Courses", 
        image: "assets/images/icon_design.jpg")
        );

    return categories;
  }
}