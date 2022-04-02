import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/pages/detail_page.dart';
import 'package:flutter_cubit/pages/nav_pages/home_page.dart';
import 'package:flutter_cubit/pages/welcome_page.dart';

import 'app_cubit.dart';
import './app_cubit_states.dart';
class AppCubitLogics extends StatefulWidget {
  //const AppCubitLogics({ Key? key }) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocBuilder<AppCubit,AppCubitStates>(
        builder: (context, state) {
          if(state is WelcomeState)
          return WelcomePage();

          if(state is LoadingState)
          return Center(child:CircularProgressIndicator(),);

           if(state is LoadedState)
          return HomePage();
          if(state is DetailState)
          return DetailPage();
          else
          return Container();
        } ,)
    );
  }
}