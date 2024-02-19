import 'dart:convert';

import 'package:bloc_project/features/post/models/post_data_model.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  static Future<List<PostDataModel>> fetchPost() async {
    List<PostDataModel> posts = [];
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        PostDataModel post =
            PostDataModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      return posts;

      // if(response.statusCode==200)
    } catch (e) {
      return [];
    }
  }

  static Future<bool> addPost() async {
    try {
      final response = await http
          .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
        'userId': 3,
        'title': 'hishamflutter dev',
        'body': 'flutterrrr'
      });
     
      print(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }

      // if(response.statusCode==200)
    } catch (e) {
      return false;
    }
  }
}
