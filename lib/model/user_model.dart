class UserModel {
  final String? id;
  final String? fullName;
  final String? block;
  final String? year;
  final DateTime? createdAt;

  UserModel({
    required this.id,
    required this.fullName,
    required this.block,
    required this.year,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'block': block,
      'year': year,
      'createdAt': createdAt,
    };
  }
}
