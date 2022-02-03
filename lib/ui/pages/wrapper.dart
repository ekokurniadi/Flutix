part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    auth.User user = Provider.of<auth.User>(context);
    if (user == null) {
      if (!(prevPage is OnSplashPage)) {
        prevPage = OnSplashPage();
        BlocProvider.of<PageBlocCubit>(context)..goToSplashPage();
      }
    } else {
      if (!(prevPage is OnMainPage)) {
        BlocProvider.of<UserBlocCubit>(context)..loadUser(user.uid);
        prevPage = OnMainPage();
        BlocProvider.of<PageBlocCubit>(context)..goToMainPage();
      }
    }
    return BlocBuilder<PageBlocCubit, PageBlocState>(builder: (_, pageState) {
      if (pageState is OnSplashPage) {
        return SplashPage();
      } else if (pageState is OnLoginPage) {
        return SignInPage();
      } else {
        return MainPage();
      }
    });
  }
}
