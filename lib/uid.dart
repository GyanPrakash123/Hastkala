class UserModel {
  String? username;
  String? uid;
  String? country;
  String? email;
  UserModel({this.username, this.uid, this.country, this.email});

//receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        username: map != null ? map['username'] : null,
        uid: map != null ? map['uid'] : null,
        country: map != null ? map['country'] : null,
        email: map != null ? map['email'] : null);
  }

  //sending data to a server
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'uid': uid,
      'country': country,
      'email': email,
    };
  }
}
