// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';

// import 'sharedpreference.dart';

// class UserManager {
//   static var userId = '';
//   static var userToken = '';
//   static var cookie = '';
//   static var role = "";
//   static var deviceId = "";
//   static var isUserLoggedIn = false;
//   // static UserFullDeatils userFullDeatils =
//   //     UserFullDeatils(); // to save userFullDeatils adn access it all over the app

//   static Future<void> intUser() async {
//     userId = await SharedPreferenceManager.instance.getValueFor("userId");
//     cookie = userToken =
//         await SharedPreferenceManager.instance.getValueFor("cookie");

//     userToken = await SharedPreferenceManager.instance.getValueFor("userToken");
//     deviceId = await SharedPreferenceManager.instance.getValueFor("deivceId");

//     isUserLoggedIn =
//         await SharedPreferenceManager.instance.getBoolValueFor("isUserLoged");
//     role = await SharedPreferenceManager.instance.getValueFor("role");

//     String js =
//         await SharedPreferenceManager.instance.getValueFor("userFullDetails");

//     if (js.isNotEmpty) {
//       // UserManager.userFullDeatils = UserFullDeatils.fromJson(json.decode(js));
//     }
//   }

//   static Future<void> saveUserId(String id) async {
//     SharedPreferenceManager.instance.setValue("userId", id);
//   }

//   static Future<void> saveDeviceId(String id) async {
//     SharedPreferenceManager.instance.setValue("deivceId", id);
//   }

//   static Future<void> saveUserToken(String id) async {
//     SharedPreferenceManager.instance.setValue("userToken", id);
//   }

//   static Future<void> saveUserCookies(String cookie) async {
//     SharedPreferenceManager.instance.setValue("cookie", cookie);
//   }

//   static Future<void> saveRole(String cookie) async {
//     SharedPreferenceManager.instance.setValue("role", cookie);
//   }

//   static Future<void> setUserLoginStatus(bool status) async {
//     SharedPreferenceManager.instance.setBoolValue("isUserLoged", status);
//   }

//   static Future<void> logOutUser(context) async {
//     SharedPreferenceManager.instance.clearDefaults();
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       Navigator.of(context).pushReplacementNamed(
//         "welcome",
//       );
//     });
//   }

//   // static Future<void> saveUserFullDeatils(
//   //     // this saves UserDetails locally for further use
//   //     UserFullDeatils userFullDeatils) async {
//   //   SharedPreferenceManager.instance
//   //       .setValue("userFullDetails", json.encode(userFullDeatils.toJson()));

//   //   UserManager.userFullDeatils = UserFullDeatils.fromJson(json.decode(
//   //       await SharedPreferenceManager.instance.getValueFor("userFullDetails")));
//   // }
// }
