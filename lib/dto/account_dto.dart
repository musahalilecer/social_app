class AccountDto {
  final String id;
  final String username;
  final String password;

  AccountDto({
    required this.id,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }
  
  factory AccountDto.fromJson(Map<String, dynamic> json) {
    return AccountDto(
      id: json['id'],
      username: json['username'],
      password: json['password'],
    );
  }
}

