class ArticleModel {
  final String titleCourse;
  final String typeCourse;
  final String imageCourse;

  ArticleModel({
    required this.titleCourse,
    required this.typeCourse,
    required this.imageCourse,
  });

  static List<ArticleModel> getArticle() {
    List<ArticleModel> articles = [];
    articles.add(ArticleModel(
        titleCourse: "How to: Work faster as\nFull Stack Designer",
        typeCourse: "UI Design",
        imageCourse: "assets/images/ui.jpg"));
    articles.add(ArticleModel(
        titleCourse: "How to: Digital Art from\nSketch",
        typeCourse: "Art Course",
        imageCourse: "assets/images/art.jpg"));
    return articles;
  }
}
