import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:futurejob/Models/CategoryModel.dart';
import 'package:http/http.dart' as http;

class CategoryProvider with ChangeNotifier {
  Future<List<CategoryModel>> getCategories() async {
    try {
      var response = await http
          .get(Uri.parse("https://bwa-jobs.herokuapp.com/categories"));
      print(response);
      print(response.statusCode);

      if (response.statusCode == 200) {
        List<CategoryModel> categories = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((category) {
          categories.add(CategoryModel.fromJson(category));
        });

        return categories;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
