import 'package:flutter/material.dart';
import 'package:futurejob/Models/CategoryModel.dart';
import 'package:futurejob/Models/JobModel.dart';
import 'package:futurejob/Providers/CategoryProvider.dart';
import 'package:futurejob/Providers/JobProvider.dart';
import 'package:futurejob/Providers/UserProvider.dart';
import 'package:futurejob/Widget/BottomNavItem.dart';
import 'package:futurejob/Widget/CardCategory.dart';
import 'package:futurejob/Widget/ListTile.dart';
import 'package:futurejob/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProdiver>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

    Widget CustomBottomNavBar() => Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: EdgeInsets.all(30),
            height: 24,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavItem(index: 0, imageUrl: "assets/icon_home.png"),
                BottomNavItem(
                    index: 1, imageUrl: "assets/icon_notification.png"),
                BottomNavItem(index: 2, imageUrl: "assets/icon_love.png"),
                BottomNavItem(index: 3, imageUrl: "assets/icon_user.png"),
              ],
            ),
          ),
        );
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Howdy",
                          style: titleTextStyle,
                        ),
                        Text(
                          userProvider.user.name,
                          style: subtitleTextStyle,
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/image_profile.png"))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hot Categories",
                      style: titleTextStyle.copyWith(
                          fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 200,
                      child: FutureBuilder<List<CategoryModel>>(
                          future: categoryProvider.getCategories(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              int index = -1;

                              return ListView(
                                scrollDirection: Axis.horizontal,
                                children: snapshot.data!.map((category) {
                                  index++;
                                  return Container(
                                    margin: EdgeInsets.only(
                                        left: index == 0 ? 24 : 0),
                                    child: CardCategory(category),
                                  );
                                }).toList(),
                              );
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Just Posted",
                      style: titleTextStyle.copyWith(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    FutureBuilder<List<JobModel>>(
                      future: jobProvider.getJobs(),
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
                    // ListTiles(
                    //     press: () {},
                    //     imageUrl: "assets/icon_google.png",
                    //     title: "Front-End Developer",
                    //     subtitle: "Google"),
                    // SizedBox(
                    //   height: 16,
                    // ),
                    // ListTiles(
                    //     press: () {},
                    //     imageUrl: "assets/icon_instagram.png",
                    //     title: "UI Designer",
                    //     subtitle: "Instagram"),
                    // SizedBox(
                    //   height: 16,
                    // ),
                    // ListTiles(
                    //     press: () {},
                    //     imageUrl: "assets/icon_facebook.png",
                    //     title: "Data Scientist",
                    //     subtitle: "Facebook"),
                    // SizedBox(
                    //   height: 16,
                    // ),
                  ],
                ),
              ],
            ),
          ),
          CustomBottomNavBar(),
        ],
      ),
    );
  }
}
