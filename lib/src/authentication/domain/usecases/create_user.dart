import 'package:equatable/equatable.dart';

import 'package:todays_meal/core/usecase/usecase.dart';
import 'package:todays_meal/core/utils/typedef.dart';
import 'package:todays_meal/src/authentication/domain/repositories/auth_repository.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  final AuthRepository _repository;

  const CreateUser(this._repository);

  @override
  ResultVoid call(CreateUserParams params) async => _repository.createUser(
        name: params.name,
        avatar: params.avatar,
        createdAt: params.createdAt,
      );
}

class CreateUserParams extends Equatable {
  final String name;
  final String avatar;
  final String createdAt;

  const CreateUserParams({
    required this.name,
    required this.avatar,
    required this.createdAt,
  });

  const CreateUserParams.empty()
      : this(name: 'name', avatar: 'avatar', createdAt: 'createdAt');

  @override
  List<Object> get props => [name, avatar, createdAt];
}
