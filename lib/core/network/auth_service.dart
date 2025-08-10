import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveTokens({
    required String access,
    required String refresh,
  }) async {
    await _prefs.setString('access_token', access);
    await _prefs.setString('refresh_token', refresh);
  }

  static Future<void> logout() async {
    await _prefs.remove('access_token');
    await _prefs.remove('refresh_token');
    print("Logged out");
  }

  static String? getAccessToken() {
    return _prefs.getString('access_token');
  }

  static String? getRefreshToken() {
    return _prefs.getString('refresh_token');
  }
}
