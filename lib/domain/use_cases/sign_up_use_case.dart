import 'package:hackerrank/domain/entities/user_entity.dart';
import 'package:hackerrank/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _authRepository;

  SignUpUseCase(this._authRepository);

  Future<UserEntity?> call(String name, String email, String password) async {
    return await _authRepository.signUp(name, email, password);
  }
}
