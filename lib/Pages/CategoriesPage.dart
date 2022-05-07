import 'package:flutter/material.dart';
import 'package:futurejob/Models/CategoryModel.dart';
import 'package:futurejob/Models/JobModel.dart';
import 'package:futurejob/Providers/JobProvider.dart';
import 'package:futurejob/Widget/ListTile.dart';
import 'package:futurejob/theme.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  final CategoryModel category;

  CategoriesPage(this.category);
  // const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 270,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              image: DecorationImage(
                  image: NetworkImage(
                    category.imageUrl,
                  ),
                  fit: BoxFit.cover),
            ),
            child: Container(
              padding: EdgeInsets.only(top: 178, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: splashTextStyle.copyWith(fontSize: 24),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "12,309 avalaible",
                    style: titleTextStyle.copyWith(
                        fontSize: 16, color: Color(0xffFFFFFF)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Big Companies",
                  style: titleTextStyle.copyWith(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                FutureBuilder<List<JobModel>>(
                  future: jobProvider.getJobsByCategory(category.name),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                          children: snapshot.data!
                              .map((job) => ListTiles(
                                  imageUrl: job.companyLogo,
                                  title: job.name,
                                  subtitle: job.companyName,
                                  press: () {}))
                              .toList());
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Startups",
                  style: titleTextStyle.copyWith(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                ListTiles(
                    press: () {},
                    imageUrl: 'assets/icon_google.png',
                    title: "Front-End Developer",
                    subtitle: "Google"),
                SizedBox(
                  height: 16,
                ),
                ListTiles(
                    press: () {},
                    imageUrl: 'assets/icon_instagram.png',
                    title: "UI Designer",
                    subtitle: "Instagram"),
                SizedBox(
                  height: 16,
                ),
                ListTiles(
                    press: () {},
                    imageUrl: 'assets/icon_facebook.png',
                    title: "Data Scientist",
                    subtitle: "Facebook")
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }
}
