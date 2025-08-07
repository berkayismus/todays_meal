import 'package:todays_meal/src/authentication/entities/user.dart';

abstract class AuthRepository {
  Future<void> createUser({
    required String name,
    required String avatar,
    required String createdAt,
  });
  Future<List<User>> getUsers();
}
