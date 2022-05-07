import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:futurejob/Models/CategoryModel.dart';
import 'package:futurejob/Pages/CategoriesPage.dart';
import 'package:futurejob/theme.dart';

class CardCategory extends StatelessWidget {
  // const CardCategory({Key? key}) : super(key: key);
  final CategoryModel category;

  CardCategory(this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CategoriesPage(category)));
      },
      child: Container(
        height: 200,
        width: 150,
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(category.imageUrl))),
        child: Container(
          padding: EdgeInsets.all(14),
          alignment: Alignment.bottomLeft,
          child: Text(
            category.name,
            style: titleTextStyle.copyWith(fontSize: 18, color: Colors.white),
            // textAlign: Alignment.bottomLeft,
          ),
        ),
      ),
    );
  }
}
