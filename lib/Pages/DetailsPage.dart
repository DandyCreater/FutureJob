import 'package:flutter/material.dart';
import 'package:futurejob/Widget/CustomButtom.dart';
import 'package:futurejob/theme.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool onClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(
              vertical: 24,
            )),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                      "assets/icon_google.png",
                    ))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Front-End Developer",
                    style: subtitleTextStyle.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Google, Inc • Jakarta",
                    style: titleTextStyle,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About the Job",
                    style: subtitleTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/dot.png"))),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Full-Time On Site",
                        style: titleTextStyle.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/dot.png"))),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Start at 18,000 per month",
                        style: titleTextStyle.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Qualifications",
                    style: subtitleTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/dot.png"))),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          "Candidate must possess at least a Bachelor's Degree.",
                          style: titleTextStyle.copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/dot.png"))),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          "Able to use Microsoft Office and Google based service.",
                          style: titleTextStyle.copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/dot.png"))),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          "Have an excellent time management, good at organized and details",
                          style: titleTextStyle.copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Responsibilities",
                    style: subtitleTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/dot.png"))),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          "Initiate and promote any programs, events, training, or activities.",
                          style: titleTextStyle.copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/dot.png"))),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          "Assessing and anticipating needs and collaborate with Division.",
                          style: titleTextStyle.copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: CustomButton(
                title: onClicked ? "Cancel Apply" : "Apply For Job",
                state: () {
                  setState(() {
                    onClicked = !onClicked;
                  });
                },
                height: 45.0,
                width: 200.0,
                color: onClicked ? Color(0xffFD4F56) : Color(0xff4141A4),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Message Recruiter",
                  style: titleTextStyle.copyWith(fontSize: 14),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
