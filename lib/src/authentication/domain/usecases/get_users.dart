import 'package:todays_meal/core/usecase/usecase.dart';
import 'package:todays_meal/core/utils/typedef.dart';
import 'package:todays_meal/src/authentication/domain/entities/user.dart';
import 'package:todays_meal/src/authentication/domain/repositories/auth_repository.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  GetUsers(this._repository);

  final AuthRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}
