import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String avatar;
  final String createdAt;

  const User({
    required this.id,
    required this.name,
    required this.avatar,
    required this.createdAt,
  });

  const User.empty()
      : this(
          name: 'name',
          avatar: 'avatar',
          createdAt: 'createdAt',
          id: 'id',
        );

  @override
  List<Object> get props => [id, name, avatar, createdAt];
}

/*
[
  {
        "id": "1"
    "name": "Darryl Herzog",
    "avatar": "https://avatars.githubusercontent.com/u/22090182",

    "createdAt": "2025-08-07T11:07:15.763Z",

]
 */


