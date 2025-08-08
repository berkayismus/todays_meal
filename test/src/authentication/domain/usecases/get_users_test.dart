import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todays_meal/src/authentication/domain/entities/user.dart';
import 'package:todays_meal/src/authentication/domain/repositories/auth_repository.dart';
import 'package:todays_meal/src/authentication/domain/usecases/get_users.dart';

import 'authentication_repository.mock.dart';

/// what does the class depend on
/// answer: authenticaon repository
/// how can we create a fake version of the dependency
/// answer: use mocktail
/// how do we control what our dependencies do
/// answer: using the mocktail's apis"

void main() {
  late AuthRepository repository;
  late GetUsers usecase;

  setUp(() {
    repository = MockAuthRepo();
    usecase = GetUsers(repository);
  });

  const tReponse = [User.empty()];

  test('should call the [AuthRepo.getUsers] and return [List<User>]', () async {
    // act
    when(() => repository.getUsers()).thenAnswer(
      (_) async => const Right(tReponse),
    );

    // arrange
    final result = await usecase();

    // assert
    expect(result, equals(const Right(tReponse)));
    verify(() => repository.getUsers()).called(1);

    verifyNoMoreInteractions(repository);
  });
}
