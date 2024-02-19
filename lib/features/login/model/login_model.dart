// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String fullName;
    String userName;
    String image;
    String userType;
    bool verificationCode;
    int status;
    String token;

    LoginModel({
        required this.fullName,
        required this.userName,
        required this.image,
        required this.userType,
        required this.verificationCode,
        required this.status,
        required this.token,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        fullName: json["full_name"],
        userName: json["user_name"],
        image: json["image"],
        userType: json["user_type"],
        verificationCode: json["verification_code"],
        status: json["status"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "user_name": userName,
        "image": image,
        "user_type": userType,
        "verification_code": verificationCode,
        "status": status,
        "token": token,
    };
}
