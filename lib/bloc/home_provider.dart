import 'package:flutter/material.dart';
import 'package:login_linkbg/data/rest/auth_rest_service.dart';

class HomeProvider extends ChangeNotifier {
  Future<bool> logout() async {
    final response = await deleteToken();
    return response;
  }
}
