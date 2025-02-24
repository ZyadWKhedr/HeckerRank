import 'package:hackerrank/data/data_sources/auth_remote_data_source.dart';
import 'package:hackerrank/domain/entities/user_entity.dart';
import 'package:hackerrank/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<UserEntity?> signUp(String name, String email, String password) async {
    final response = await _authRemoteDataSource.signUp(name, email, password);
    if (response.user != null) {
      return UserEntity(id: response.user!.id, email: response.user!.email!);
    }
    return null;
  }

  @override
  Future<UserEntity?> login(String email, String password) async {
    final response = await _authRemoteDataSource.login(email, password);
    if (response.user != null) {
      return UserEntity(id: response.user!.id, email: response.user!.email!);
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    await _authRemoteDataSource.signOut();
  }
}
