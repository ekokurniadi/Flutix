part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Column(
        children: [
          Center(
            child: RaisedButton(
              onPressed: () {
                AuthServices.signOut();
              },
              child: BlocBuilder<UserBlocCubit, UserBlocState>(
                builder: (_, state) {
                  if (state is UserBlocLoaded) {
                    return Text(state.user.name);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
