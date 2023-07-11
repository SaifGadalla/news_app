import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/science_screen.dart';
import 'package:news_app/settings_screen.dart';
import 'package:news_app/sport_screen.dart';
import 'package:news_app/states.dart';

import 'business_screen.dart';
import 'dio_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = const [
    BusinessScreen(),
    ScienceScreen(),
    SportScreen(),
    SettingsScreen(),
  ];

  int currentIndex = 0 ;

  void changeIndex(int index){
    currentIndex = index ;
    emit(AppChangeBottomNavState());
  }

  bool isDark = false;

  void changeAppMode(){
    isDark = !isDark;
    emit(AppChangeModeState());
  }

  List<dynamic> business = [];

  void getBusiness (){
    emit(AppLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'business',
          'apiKey':'b9bcfaa921714224b8655b262cf5837c'
        }).then((value){
      business = value.data['articles'];
      emit(AppGetBusinessSuccessState());
    }).catchError((error){
      print('get business data error : $error');
      emit(AppGetBusinessFailState(error.toString()));
    });
  }

  List<dynamic> science = [];

  void getScience(){
    emit(AppLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'science',
          'apiKey':'b9bcfaa921714224b8655b262cf5837c'
        }
    ).then((value) {
      science=value.data['articles'];
      emit(AppGetScienceSuccessState());
    }).catchError((error){
      print('get science data error : $error');
      emit(AppGetScienceFailState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports(){
    emit(AppLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'sports',
          'apiKey':'b9bcfaa921714224b8655b262cf5837c'
        }
    ).then((value) {
      sports=value.data['articles'];
      emit(AppGetSportsSuccessState());
    }).catchError((error){
      print('get sports data error : $error');
      emit(AppGetSportsFailState(error.toString()));
    });
  }
}