// To parse this JSON data, do
//
//     final postDataModel = postDataModelFromMap(jsonString);

import 'dart:convert';

List<PostDataModel> postDataModelFromMap(String str) => List<PostDataModel>.from(json.decode(str).map((x) => PostDataModel.fromMap(x)));

String postDataModelToMap(List<PostDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PostDataModel {
    int userId;
    int id;
    String title;
    String body;

    PostDataModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory PostDataModel.fromMap(Map<String, dynamic> json) => PostDataModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
