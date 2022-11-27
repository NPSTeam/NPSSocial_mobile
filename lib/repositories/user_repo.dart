import 'dart:io';

import 'package:nps_social/models/user_model.dart';
import 'package:nps_social/repositories/crud_repo.dart';

final userRepository = _UserRepository();

class _UserRepository extends CrudRepository {
  Future<List<UserModel>?> getSuggestions() async {
    List<UserModel>? users;

    var result = await get('/api/user/getSuggestionUsers');
    if (result?.data['users'] != null) {
      users = List<UserModel>.from(
          result?.data['users'].map((e) => UserModel.fromJson(e)));
      return users;
    }

    return null;
  }

  Future<bool?> follow({required String userId}) async {
    var result = await patch('/api/user/$userId/follow');
    if (result?.statusCode == HttpStatus.ok) {
      return true;
    }

    return false;
  }

  Future<List<UserModel>?> searchUser({required String query}) async {
    List<UserModel>? users;

    var result = await post(
      '/api/user/search',
      data: {
        'fullName': query,
      },
    );
    if (result?.data['users'] != null) {
      users = List<UserModel>.from(
          result?.data['users'].map((e) => UserModel.fromJson(e)));
      return users;
    }

    return null;
  }
}
