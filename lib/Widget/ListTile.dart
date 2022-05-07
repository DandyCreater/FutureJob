import 'package:flutter/material.dart';
import 'package:futurejob/theme.dart';

class ListTiles extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final Function() press;

  ListTiles(
      {required this.imageUrl,
      required this.title,
      required this.subtitle,
      required this.press});

  // const ListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/homepage');
      },
      child: Container(
        padding: EdgeInsets.all(10),
        height: 85,
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              margin: EdgeInsets.only(right: 24),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                imageUrl,
              ))),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    subtitle,
                    style: titleTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xffECEDF1)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
