part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');
  static Future<void> updateUser(User user) async {
    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguages': user.selectedLanguages,
      'profilePicture': user.profilePicture ?? "",
    });
  }

  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return User(
      id,
      snapshot.data()['email'],
      balance: snapshot.data()['balance'],
      profilePicture: snapshot.data()['profilePicture'],
      selectedGenres: (snapshot.data()['selectedGenres'] as List)
          .map((e) => e.toString())
          .toList(),
      selectedLanguages: snapshot.data()['selectedLanguages'],
      name: snapshot.data()['name'],
    );
  }
}
