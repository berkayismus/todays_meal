import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todays_meal/src/authentication/domain/repositories/auth_repository.dart';
import 'package:todays_meal/src/authentication/domain/usecases/create_user.dart';

import 'authentication_repository.mock.dart';

/// what does the class depend on
/// answer: authenticaon repository
/// how can we create a fake version of the dependency
/// answer: use mocktail
/// how do we control what our dependencies do
/// answer: using the mocktail's apis

void main() {
  late CreateUser usecase;
  late AuthRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });

  const params = CreateUserParams.empty();

  test(
    "should call [AuthRepo.createUser]",
    () async {
      // arrange
      when(
        () => repository.createUser(
            name: any(named: 'name'),
            avatar: any(named: 'avatar'),
            createdAt: any(named: 'createdAt')),
      ).thenAnswer(
        (_) async => const Right(null),
      );

      // act
      final result = await usecase(params);

      // assert
      expect(result, equals(const Right(null)));
      verify(() => repository.createUser(
            name: params.name,
            avatar: params.avatar,
            createdAt: params.createdAt,
          )).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
