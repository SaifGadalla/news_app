import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_screen.dart';
import 'package:news_app/cubit.dart';
import 'package:news_app/dio_helper.dart';
import 'package:news_app/science_screen.dart';
import 'package:news_app/sport_screen.dart';
import 'package:news_app/states.dart';

class HomeScreen extends StatelessWidget{

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'science',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_basketball,
      ),
      label: 'sports',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getBusiness(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {

          var cubit = AppCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Center(child: Text('News App'),),
              leading: IconButton(
                splashRadius: 22,
                icon: Icon(
                  Icons.brightness_4_sharp,
                ),
                onPressed: () {
                  AppCubit.get(context).changeAppMode();
                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                cubit.changeIndex(index);
                // setState(() {
                //   currentIndex = index;
                // });
              },
              type: BottomNavigationBarType.fixed,
              items: items,
              currentIndex: cubit.currentIndex,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}