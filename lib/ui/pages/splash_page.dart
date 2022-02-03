part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            BlocProvider.of<PageBlocCubit>(context)..goToLoginPage();
          },
          child: Text("Go to Login Page"),
        ),
      ),
    );
  }
}
