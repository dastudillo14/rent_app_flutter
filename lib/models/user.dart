
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        required this.names,
        required this.password,
        required this.phone,
        required this.email,
    });

    String names;
    String password;
    String phone;
    String email;

    factory User.fromJson(Map<String, dynamic> json) => User(
        names: json["names"],
        password: json["password"],
        phone: json["phone"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "names": names,
        "password": password,
        "phone": phone,
        "email": email,
    };
}
