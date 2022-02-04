part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSignin = false;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ThemeBlocCubit>(context)
      ..changeTheme(ThemeData().copyWith(primaryColor: accentColor2));
    return WillPopScope(
      onWillPop: () {
        BlocProvider.of<PageBlocCubit>(context)..goToSplashPage();
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(top: 54),
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                  child: Image.asset('assets/logo.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 70, bottom: 40),
                  child: Text(
                    "Welcome Back\nExplorer",
                    style: blackTextFont.copyWith(fontSize: 20),
                  ),
                ),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      isEmailValid = EmailValidator.validate(text);
                    });
                  },
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      isPasswordValid = text.length >= 6;
                    });
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      "Forgot Password? ",
                      style: greyTextFont.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Get Now",
                      style: purpleTextFont.copyWith(fontSize: 12),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(top: 40, bottom: 30),
                    child: isSignin
                        ? SpinKitFadingCircle(color: mainColor)
                        : FloatingActionButton(
                            elevation: 0,
                            child: Icon(Icons.arrow_forward,
                                color: isEmailValid && isPasswordValid
                                    ? Colors.white
                                    : Color(0xFFBEBEBE)),
                            backgroundColor: isEmailValid && isPasswordValid
                                ? mainColor
                                : Color(0xFFE4E4E4),
                            onPressed: isEmailValid && isPasswordValid
                                ? () async {
                                    setState(() {
                                      isSignin = true;
                                    });
                                    SignInSignUpResult result =
                                        await AuthServices.signIn(
                                      usernameController.text,
                                      passwordController.text,
                                    );
                                    if (result.user == null) {
                                      setState(() {
                                        isSignin = false;
                                      });
                                      Flushbar(
                                        duration: Duration(milliseconds: 1500),
                                        flushbarPosition: FlushbarPosition.TOP,
                                        backgroundColor: Colors.red,
                                        message: result.message,
                                      )..show(context);
                                    }
                                  }
                                : null,
                          ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Start Fresh Now? ",
                      style: greyTextFont.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Sign Up",
                      style: purpleTextFont.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
