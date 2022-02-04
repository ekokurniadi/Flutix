part of 'pages.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // note: HEADER
        Container(
          padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 20),
          decoration: BoxDecoration(
            color: accentColor1,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: BlocBuilder<UserBlocCubit, UserBlocState>(builder: (_, state) {
            if (state is UserBlocLoaded) {
              return Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF5F5F5F), width: 1),
                    ),
                    child: Stack(
                      children: [
                        SpinKitFadingCircle(color: accentColor2, size: 50),
                        Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: (state.user.profilePicture == ""
                                      ? AssetImage("assets/user_pic.png")
                                      : NetworkImage(
                                          state.user.profilePicture)),
                                  fit: BoxFit.cover),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                 Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin -
                            78,
                        child: Text(
                          state.user.name,
                          style: whiteTextFont.copyWith(fontSize: 18),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: Text(
                          NumberFormat.currency(
                                  locale: "id_ID",
                                  decimalDigits: 0,
                                  symbol: "IDR ")
                              .format(state.user.balance),
                          style: yellowNumberFont.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  )
                ],
              );
            } else {
              return SpinKitFadingCircle(color: mainColor, size: 50);
            }
          }),
        )
      ],
    );
  }
}
