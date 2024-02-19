import 'package:bloc_project/features/login/model/login_model.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  static Future<LoginModel> login(
      {required String email, required String password}) async {
    try {
      final response = await http.post(
          Uri.parse('https://wezbrain.leadmlm.in/bo/api/mobile/login'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        LoginModel res = loginModelFromJson(response.body);
        return res;
      } else {
        print('error');
        throw Exception('error');
      }
    } catch (e) {
      throw Exception('error');
    }
  }
}
