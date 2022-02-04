part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SingleChildScrollView(
                      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 136,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo.png'), fit: BoxFit.contain),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 16),
              child: Text(
                "New Experiences",
                style: blackTextFont.copyWith(fontSize: 20),
              ),
            ),
            Text(
              "Watch a new movie much\neasier than any before",
              style: greyTextFont.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              width: 250,
              height: 46,
              margin: EdgeInsets.only(top: 70, bottom: 19),
              child: RaisedButton(
                color: mainColor,
                onPressed: () {},
                child: Text(
                  "Get Started",
                  style: whiteTextFont.copyWith(fontSize: 16),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<PageBlocCubit>(context)..goToLoginPage();
                  },
                  child: Text(
                    "Sign in",
                    style: purpleTextFont,
                  ),
                )
              ],
            )
        ],
      ),
          )),
    );
  }
}
