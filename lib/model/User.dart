class User {
  String username;
  String email;
  String role;

  User({this.username, this.email, this.role});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}