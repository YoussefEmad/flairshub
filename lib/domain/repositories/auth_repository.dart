class AuthRepository {
  Future<Map<String, String>> login(String email, String password) async {

    await Future.delayed(const Duration(seconds: 1));

    if (email == 'admin' && password == '1234') {
      return {
        'access': 'static_access_token_abc123',
        'refresh': 'static_refresh_token_xyz789',
      };
    } else {
      throw Exception('Invalid email or password');
    }
  }
}
