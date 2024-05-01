import 'package:courseapp/models/articles_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:courseapp/models/category_models.dart';
import 'package:courseapp/models/popular_model.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<PopularModel> populars = [];
  List<ArticleModel> articles = [];

  void _getInilitation() {
    categories = CategoryModel.getCategory();
    populars = PopularModel.getPopular();
    articles = ArticleModel.getArticle();
  }

  @override
  Widget build(BuildContext context) {
    _getInilitation();
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
          child: Column(children: [
        const SizedBox(height: 20),
        _header(),
        _headline(),
        _ketegori(),
        const SizedBox(
          height: 10,
        ),
        _popularHeader(),
        const SizedBox(
          height: 10,
        ),
        _popular(),
        const SizedBox(
          height: 10,
        ),
        _articlesHeader(),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(itemBuilder: (context,index) => Container(
           
            height: 100,
            child: Row(
              children: [
                Image.asset(articles[index].imageCourse,fit: BoxFit.cover,width: 100,height: 100,),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(articles[index].titleCourse,style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                      ),
                      
                      ),
                      Text(
                        articles[index].typeCourse,
                        textAlign: TextAlign.left,             
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xffA2ADB1)
                      ),)
                    ],
                  ),
                ),
                Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.favorite,color: Colors.pinkAccent,)))
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ), padding: EdgeInsets.only(
            right: 25,
            left: 25,
          )
          ,separatorBuilder: (context, index) => const SizedBox(height: 10,), itemCount: articles.length,shrinkWrap: true,),
        )
      ])),
    );
  }

  Row _articlesHeader() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: RichText(
              text: TextSpan(
                text: 'Articles',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: RichText(
              text: TextSpan(
                text: 'Show All',
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 19, 209, 85),
                ),
              ),
            ),
          ),
        ],
      );
  }

  Container _popular() {
    return Container(
      height: 200,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 100,
                  child:
                      Image.asset(populars[index].imageUrl, fit: BoxFit.cover),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            populars[index].price,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 12, 219, 57)),
                          ),
                        ),
                      ),
                      Text(populars[index].name,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: populars.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }

  Row _popularHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: RichText(
            text: TextSpan(
              text: 'Popular Course',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: RichText(
            text: TextSpan(
              text: 'Show All',
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 19, 209, 85),
              ),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _ketegori() {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 10, right: 20, top: 10),
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 40, top: 20, bottom: 10),
              child: Column(
                children: [
                  Image.asset(
                    categories[index].image,
                    height: 55,
                    width: 55,
                    fit: BoxFit.fill,
                  ),
                  const Spacer(),
                  Text(
                    categories[index].name,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    textAlign: TextAlign.left,
                    categories[index].course,
                    style: GoogleFonts.poppins(
                        fontSize: 10, color: const Color(0xffA2ADB1)),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _headline() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: 'Want to Study Class\nWhats Today?',
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  Padding _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/jhony.jpg'),
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 35,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
                size: 35,
              )),
        ],
      ),
    );
  }
}
