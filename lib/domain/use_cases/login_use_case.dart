import 'package:hackerrank/domain/entities/user_entity.dart';
import 'package:hackerrank/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<UserEntity?> call(String email, String password) async {
    return await _authRepository.login(email, password);
  }
}
