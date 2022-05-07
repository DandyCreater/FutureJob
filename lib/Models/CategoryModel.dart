class CategoryModel {
  late String id;
  late String name;
  late String imageUrl;
  late int createdAt;
  late int updatedAt;

  CategoryModel(
      {this.id = "",
      this.name = "",
      this.imageUrl = "",
      this.createdAt = 0,
      this.updatedAt = 0});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
