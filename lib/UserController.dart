
import 'ApiService.dart';
import 'UserModel.dart';


class UserController {
  final ApiService _apiService = ApiService();

  Future<List<UserModel>> fetchUsers() async {
    try {
      return await _apiService.getUsers();
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
}

/*class UserController {
  final ApiService _apiService = ApiService();

  Future<List<UserModel>> fetchUsers() async {
    try {
      return await _apiService.getUsers();
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
}*/