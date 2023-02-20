import 'package:flutter/material.dart';
import 'package:npssolutions_mobile/configs/spref_key.dart';
import 'package:npssolutions_mobile/models/auth_model.dart';
import 'package:npssolutions_mobile/models/response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dio_repo.dart';

class AuthController extends ChangeNotifier {
  late BuildContext context;

  bool isAuthenticated = false;
  AuthModel? auth;

  AuthController(BuildContext context) {
    SharedPreferences.getInstance().then((instance) async {
      auth?.refreshToken = instance.getString(SPrefKey.refreshToken) ?? '';
      auth?.accessToken = instance.getString(SPrefKey.accessToken) ?? '';
      notifyListeners();
    });
  }

  Future refreshAuthentication() async {}

  Future<bool> login() async {
    ResponseModel? response = await DioRepo.post(
      '/api/v1/auth/login',
      data: {
        "username": "sangphan45",
        "password": "#Minhthu28092001",
        "rememberMe": true,
      },
      unAuth: true,
    );

    auth = AuthModel.fromJson(response?.data);
    notifyListeners();

    return true;
  }
}
