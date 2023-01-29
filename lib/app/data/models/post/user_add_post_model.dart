import 'dart:convert';

class UserAddPostModel {
  final String name;
  final String gender;
  final String email;
  final String status;
  UserAddPostModel({
    required this.name,
    required this.gender,
    required this.email,
    required this.status,
  });

  UserAddPostModel copyWith({
    String? name,
    String? gender,
    String? email,
    String? status,
  }) {
    return UserAddPostModel(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'gender': gender,
      'email': email,
      'status': status,
    };
  }

  factory UserAddPostModel.fromMap(Map<String, dynamic> map) {
    return UserAddPostModel(
      name: map['name'] as String,
      gender: map['gender'] as String,
      email: map['email'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAddPostModel.fromJson(String source) =>
      UserAddPostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
