import 'package:social_app/db_helper/db_helper.dart';

class AuthHelper {
  final DBHelper _dbHelper = DBHelper();

  Future<bool> login(String username, String password) async {
    final users = await _dbHelper.queryAll('accounts');
    for (var user in users) {
      if (user['username'] == username && user['password'] == password) {
        return true;
      }
    }
    return false;
  }

  Future<bool> register(String username, String password) async {
    // Check if username already exists
    final users = await _dbHelper.queryAll('accounts');
    for (var user in users) {
      if (user['username'] == username) {
        return false; // Username already taken
      }
    }
    // Insert new user
    await _dbHelper.insert('accounts', {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'username': username,
      'password': password,
    });
    return true;
  }
}
