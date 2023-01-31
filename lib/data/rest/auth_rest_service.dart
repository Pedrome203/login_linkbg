import '../../utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> authentication(String email, String password) async {
  await Future.delayed(const Duration(seconds: 3));

  if (email == userEmail && password == userPassword) {
    await saveToken();
    return true;
  } else {
    return false;
  }
}

saveToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token',
      userEmail + userPassword); //NO SE DEBE GUARDAR ESTE TIPO DE INFORMACIÓN
}

Future<bool> validateToken() async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  if (token == userEmail + userPassword) {
    return true;
  } else {
    return false;
  }
}

Future<bool> deleteToken() async {
  await Future.delayed(const Duration(seconds: 3));
  final prefs = await SharedPreferences.getInstance();
  final success = await prefs.remove('token');
  return success;
}
