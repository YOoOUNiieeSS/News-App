import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/news_screen/news_screen.dart';
import 'package:news_app/modules/science_screen/science_screen.dart';
import 'package:news_app/modules/settings_screen/settings_screen.dart';
import 'package:news_app/modules/sports_screen/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(AppInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> navBarItems=[
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: 'Sports'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: 'Science'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings'
    ),
  ];
  List<Widget> screens = [
    NewsScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen()
  ];
  int currentIndex = 0;

  void changeIndex(int i){
    currentIndex=i;
    emit(AppBottomNavBarState());
  }

  List<dynamic> business=[];
  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url: '/v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'06fee49579944b0b8d53c43cd2c7238e'
        }).then((value){
          business=value.data['articles'];
          emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports=[];
  void getSports(){
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
        url: '/v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'06fee49579944b0b8d53c43cd2c7238e'
        }).then((value){
      sports=value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  List<dynamic> science=[];
  void getScience(){
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
        url: '/v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'06fee49579944b0b8d53c43cd2c7238e'
        }).then((value){
      science=value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> search=[];
  void getSearch(String value){
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
        url: '/v2/everything',
        query: {
          'q':'$value',
          'apiKey':'06fee49579944b0b8d53c43cd2c7238e'
        }).then((value){
      search=value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

}
