part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: (){
            AuthServices.signIn("ekokurniadi.02@gmail.com", "123456");
          },
          child: Text("Signin"),
        ),
      ),
    );
  }
}
