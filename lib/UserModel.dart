class UserModel {
  final int userId;
  final String userFullName;
  final String email;
  final int phoneNumber;
  final String userPwd;
  final int userTypeId;

  UserModel({
    required this.userId,
    required this.userFullName,
    required this.email,
    required this.phoneNumber,
    required this.userPwd,
    required this.userTypeId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      userFullName: json['user_full_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      userPwd: json['user_pwd'],
      userTypeId: json['user_type_id'],
    );
  }
}