import '../../core/network/auth_service.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository = AuthRepository();

  LoginUseCase(AuthRepository authRepository);

  Future<void> login(String email, String password) async {
    final tokens = await _repository.login(email, password);
    await AuthService.saveTokens(
      access: tokens['access']!,
      refresh: tokens['refresh']!,
    );
  }
}
