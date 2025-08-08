import 'package:dartz/dartz.dart';
import 'package:todays_meal/core/utils/typedef.dart';
import 'package:todays_meal/src/authentication/domain/entities/user.dart';

abstract class AuthRepository {
  ResultVoid createUser({
    required String name,
    required String avatar,
    required String createdAt,
  });
  ResultFuture<List<User>> getUsers();
}
