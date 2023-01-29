import 'dart:convert';

class UserPostModel {
  final String name;
  final String email;
  final String status;
  UserPostModel({
    required this.name,
    required this.email,
    required this.status,
  });

  UserPostModel copyWith({
    String? name,
    String? email,
    String? status,
  }) {
    return UserPostModel(
      name: name ?? this.name,
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'status': status,
    };
  }

  factory UserPostModel.fromMap(Map<String, dynamic> map) {
    return UserPostModel(
      name: map['name'] as String,
      email: map['email'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPostModel.fromJson(String source) =>
      UserPostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
