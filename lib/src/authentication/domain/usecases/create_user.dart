import 'package:todays_meal/core/utils/typedef.dart';
import 'package:todays_meal/src/authentication/domain/repositories/auth_repository.dart';

class CreateUser {
  final AuthRepository _repository;

  const CreateUser(this._repository);

  ResultVoid createUser({
    required String name,
    required String avatar,
    required String createdAt,
  }) async =>
      _repository.createUser(name: name, avatar: avatar, createdAt: createdAt);
}
