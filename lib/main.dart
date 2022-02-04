import 'package:firebase_core/firebase_core.dart';
import 'package:flutix/bloc/blocs.dart';
import 'package:flutix/services/services.dart';
import 'package:flutix/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PageBlocCubit()),
          BlocProvider(create: (_) => UserBlocCubit()),
          BlocProvider(create: (_) => ThemeBlocCubit()),
        ],
        child: BlocBuilder<ThemeBlocCubit, ThemeBlocState>(
          builder: (context, state) {
            return MaterialApp(
              theme: state.themeData,
              debugShowCheckedModeBanner: false,
              home: Wrapper(),
            );
          },
        ),
      ),
    );
  }
}
