// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:bloc_project/infrastructure/api/app_exception.dart';
// import 'package:http/http.dart' as http;
// import 'package:myhome/infastructure/managers/index.dart';

// import 'index.dart';

// class ApiBaseHelper {
//   static Map<String, String> commonHeaders = {
//     'Content-Type': 'application/json; charset=utf-8',
//   };
//   static Map<String, String> commonHeader2 = {
//     'Content-Type': 'application/x-www-form-urlencoded',
//   };

//   // <-------------------  get method ---------------------->

//   static Future<dynamic> get(String url,
//       {bool isHeaderRequired = false}) async {
//     log(url.toString());
//     // ignore: prefer_typing_uninitialized_variables
//     var responseJson;
//     if (isHeaderRequired) {
//       await UserManager.intUser();
//       var token = UserManager.userToken;

//       commonHeaders.addAll({'Authorization': 'Bearer $token'});
//     }
//     try {
//       final response = await http.get(Uri.parse(url), headers: commonHeaders);
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     }
//     return responseJson;
//   }

//   static Future<dynamic> getwithquery(String url, queryParameters,
//       {bool isHeaderRequired = false}) async {
//     // ignore: prefer_typing_uninitialized_variables
//     var responseJson;
//     if (isHeaderRequired) {
//       await UserManager.intUser();
//       var token = UserManager.userToken;

//       commonHeaders.addAll({'Authorization': 'Bearer $token'});
//     }
//     try {
//       final uri = Uri.https(url, queryParameters);

//       final response = await http.get(
//         uri,
//         headers: commonHeaders,
//       );
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     }
//     return responseJson;
//   }

//   static Future<dynamic> postUploadImage(String url,
//       dynamic bodyExceptImageField, String imageField, File image) async {
//     print('Api Post, url $url');
//     await UserManager.intUser();
//     String token = UserManager.userToken;
//     commonHeaders.addAll(
//         {'Authorization': 'Bearer $token', "Accept": "application/json"});

//     var stream = http.ByteStream(image.openRead());
//     stream.cast();

//     //var length = await image.length();

//     var multipart = await http.MultipartFile.fromPath(imageField, image.path);

//     var uri = Uri.parse(url);

//     var request = http.MultipartRequest('POST', uri);

//     request.headers.addAll(commonHeaders);

//     request.fields.addAll(bodyExceptImageField);

//     request.files.add(multipart);

//     var streamedResponse = await request.send();

//     //var response = await http.Response.fromStream(streamedResponse);

//     //var response = streamedResponse.stream.bytesToString();

//     //var responseJson = _returnResponse(response);

//     if (streamedResponse.statusCode == 200) {
//       print("success__________________________________________");
//       var response = await streamedResponse.stream.bytesToString();
//       return response;
//     } else {
//       print(streamedResponse.statusCode);
//       print(await streamedResponse.stream.bytesToString());
//     }
//   }

//   // <-----------------  post method --------------------->

//   static Future<dynamic> post(String url, dynamic body,
//       {bool isHeaderRequired = true}) async {
//     print('Api Post, url => $url');
//     var responseJson;
//     log(url.toString());
//     log('=> $body');
//     if (isHeaderRequired) {
//       await UserManager.intUser();
//       var token = UserManager.userToken;
//       commonHeaders.addAll({'Authorization': 'Bearer $token'});
//     }

//     try {
//       final response = await http.post(Uri.parse(url),
//           body: json.encode(body), headers: commonHeaders);
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     }
//     return responseJson;
//   }

//   ///<-------------------- pathch ------------------------->

//   static Future<dynamic> patch(String url, dynamic body,
//       {bool isHeaderRequired = true, bool header2 = false}) async {
//     print('Api Post, url => $url');
//     var responseJson;
//     log(url.toString());
//     log('=> $body');
//     if (isHeaderRequired) {
//       await UserManager.intUser();
//       var token = UserManager.userToken;
//       print(token);

//       commonHeaders.addAll({
//         'Authorization': 'Bearer $token',
//       });
//       commonHeader2.addAll({
//         'Authorization': 'Bearer $token',
//       });
//     }

//     try {
//       final response = await http.patch(Uri.parse(url),
//           body: json.encode(body),
//           headers: header2 ? commonHeader2 : commonHeaders);
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       print('No net');
//       throw FetchDataException('No Internet connection');
//     }
//     print('api post.');
//     return responseJson;
//   }

//   // <---------------------- file post ------------------------->

//   static Future<dynamic> postFile(
//       String url, List<File> files, String title, String description) async {
//     print('Api Post, url $url');
//     var responseJson;
//     var cookies = UserManager.cookie;
//     print(cookies);

//     print(cookies);

//     commonHeaders.addAll({
//       'Cookie': cookies
//     }); // var stream = http.ByteStream(DelegatingStream.typed(file.readStream));

//     // var length = file.;
//     try {
//       var request = http.MultipartRequest(
//         "POST",
//         Uri.parse(url),
//       );

//       request.fields["author"] = UserManager.userId;
//       request.fields["title"] = title;
//       request.fields["description"] = description;

//       for (var file in files) {
//         var multipartFile = await http.MultipartFile.fromPath(
//           'image',
//           file.path,
//           filename: file.path.split('/').last,
//         );
//         request.files.add(multipartFile);
//       }

//       // var multipartFile = await http.MultipartFile.fromPath('files', file.path,
//       //     filename: file.path);

//       // request.files.add(multipartFile);
//       request.headers.addAll(commonHeaders);
//       var response = await request.send();

//       final res = await http.Response.fromStream(response);

//       responseJson = _returnResponse(res);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     }

//     return responseJson;
//   }

//   // <-------------------------  profile update ----------------------------->
//   static Future<dynamic> profileUpdate(
//       String url,
//       // List<File> files,
//       File? files,
//       {required bool isHeaderRequired}) async {
//     print('Api Post, url $url');
//     var responseJson;
//     // var cookies = UserManager.cookie;

//     // commonHeaders.addAll({
//     //   'Cookie': cookies
//     // }); // var stream = http.ByteStream(DelegatingStream.typed(file.readStream));

//     // var length = file.;
//     try {
//       var request = http.MultipartRequest(
//         "PATCH",
//         Uri.parse(url),
//       );

//       try {
//         var multipartFile = await http.MultipartFile.fromPath(
//             'image', files!.path,
//             filename: files.path);

//         request.files.add(multipartFile);
//         request.headers.addAll(commonHeaders);
//         var response = await request.send();

//         final res = await http.Response.fromStream(response);

//         responseJson = _returnResponse(res);
//       } on SocketException {
//         throw FetchDataException('No Internet connection');
//       }

//       return responseJson;
//     } catch (e) {
//       print(e);
//     }
//   }

//   static Future<dynamic> postSingleFile(
//       String url,
//       String title,
//       String description,
//       // List<File> files,
//       List<File> files,
//       {required bool isHeaderRequired}) async {
//     print('Api Post, url $url');
//     var responseJson;
//     var cookies = UserManager.cookie;

//     commonHeaders.addAll({
//       'Cookie': cookies
//     }); // var stream = http.ByteStream(DelegatingStream.typed(file.readStream));

//     var request = http.MultipartRequest(
//       "POST",
//       Uri.parse(url),
//     );
//     // var length = file.;
//     try {
//       for (var file in files) {
//         var multipartFile = await http.MultipartFile.fromPath(
//           'image',
//           file.path,
//           filename: file.path.split('/').last,
//         );
//         request.files.add(multipartFile);
//       }
//       log("---------------------->>>>");
//       request.fields["title"] = title;
//       request.fields["description"] = description;
//       request.fields["author"] = UserManager.userId.toString();
//       request.headers.addAll(commonHeaders);
//       var response = await request.send();

//       final res = await http.Response.fromStream(response);

//       responseJson = _returnResponse(res);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     }
//     return responseJson;
//   }

//   // <------------------------  put method ------------------------------>
//   static Future<dynamic> put(String url, dynamic body,
//       {bool isHeaderRequired = false}) async {
//     print(body.toString());
//     print('Api Put, url $url');
//     if (isHeaderRequired) {
//       await UserManager.intUser();
//       var token = UserManager.userToken;
//       commonHeaders.addAll({'Authorization': 'Bearer $token'});
//     }
//     var responseJson;
//     try {
//       final response = await http.put(Uri.parse(url),
//           body: json.encode(body), headers: commonHeaders);
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       print('No net');
//       throw FetchDataException('No Internet connection');
//     }
//     print('api put.');
//     print(responseJson.toString());
//     return responseJson;
//   }

//   static Future<dynamic> delete(String url,
//       {dynamic body, bool isHeaderRequired = false}) async {
//     print('Api delete, url $url');

//     await UserManager.intUser();
//     String token = UserManager.userToken;
//     commonHeaders.addAll({'Authorization': 'Bearer $token'});

//     var apiResponse;
//     try {
//       final response =
//           await http.delete(Uri.parse(url), headers: commonHeaders);
//       apiResponse = _returnResponse(response);
//     } on SocketException {
//       print('No net');
//       throw FetchDataException('No Internet connection');
//     }
//     print('api delete.');
//     return apiResponse;
//   }
// }

// dynamic _returnResponse(http.Response response) {
//   switch (response.statusCode) {
//     case 200:
//       //var responseJson = json.decode(response.body.toString());
//       return response.body.toString();
//     case 201:
//       return response.body.toString();
//     case 400:
//       throw BadRequestException(response.body.toString());
//     case 401:
//     case 403:
//       throw UnauthorisedException(response.body.toString());
//     case 404:
//       throw UnauthorisedException(response.body.toString());
//     case 500:
//     default:
//       throw FetchDataException(
//           'Error occured while Communication with Server with StatusCode : ${response.statusCode}  ${response.body}');
//   }
// }
