import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_shortener/ui/screen/home.dart';
import 'package:url_shortener/ui/theme.dart';

import 'core/bloc/observer.dart';
import 'core/bloc/short_link/create/bloc.dart';

void main() {

  Bloc.observer = USBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ShortLinkCreateBloc>(
          create: (BuildContext context) => ShortLinkCreateBloc(),
        ),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shortly',
      theme: ThemeProvider.themeData,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}