part of 'services.dart';

class AuthServices {
  static auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, password, name,
      List<String> selectedGenres, String selectedLanguages) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguages: selectedLanguages);

      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().replaceRange(0, 15, '').split(']')[1]);
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = await result.user.fromFireStore();
      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().replaceRange(0, 15, '').split(']')[1]);
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<auth.User> get userStream => _auth.authStateChanges();

}

class SignInSignUpResult {
  User user;
  String message;

  SignInSignUpResult({this.user, this.message});
}
