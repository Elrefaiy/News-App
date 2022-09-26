import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/modules/home/home.dart';
import 'package:newsapp/modules/search/search.dart';
import 'package:newsapp/modules/settings/settings.dart';
import 'package:newsapp/shared/network/local/cache_helper.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  var searchController = TextEditingController();

  int currentIndex = 0;
  int catIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    SettingsScreen(),
  ];

  List<String> titles = [
    'News',
    'Search',
    'Settings'
  ];

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined,), activeIcon: Icon(Icons.home,), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.search,), label: 'Search'),
    BottomNavigationBarItem(icon: Icon(Icons.settings_outlined,), activeIcon: Icon(Icons.settings,), label: 'Settings'),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarIndex());
  }

  void changeCatIndex(int index) {
    catIndex = index;
    print(catIndex);
    emit(ChangeCategoriesIndex());
  }

  List<dynamic> allNews = [];

  void getAllNews() {
    emit(GetAllNewsLoading());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'domains': 'wsj.com',
        'apiKey': '79c83924f52c4cc2bbcc9b34c9ad40d5',
      },
    ).then(
          (value) {
        allNews = value.data['articles'];

        emit(GetAllNewsSuccess());
      },
    ).catchError((error) {
      print(error.toString());
      emit(GetAllNewsError(error.toString()));
    });
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(GetBusinessLoading());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '79c83924f52c4cc2bbcc9b34c9ad40d5',
      },
    ).then(
      (value) {
        business = value.data['articles'];
        emit(GetBusinessSuccess());
      },
    ).catchError((error) {
      print(error.toString());
      emit(GetBusinessError(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(GetSportsLoading());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': '79c83924f52c4cc2bbcc9b34c9ad40d5',
      },
    ).then(
          (value) {
        sports = value.data['articles'];
        emit(GetSportsSuccess());
      },
    ).catchError((error) {
      print(error.toString());
      emit(GetSportsError(error.toString()));
    });
  }

  int activeIndex = 0;

  void changeIndicatorIndex(int index){
    activeIndex = index;
    emit(ChangeActiveIndex());
  }

  List<dynamic> science = [];

  void getScience() {
    emit(GetScienceLoading());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '79c83924f52c4cc2bbcc9b34c9ad40d5',
      },
    ).then(
          (value) {
            science = value.data['articles'];

        emit(GetScienceSuccess());
      },
    ).catchError((error) {
      print(error.toString());
      emit(GetScienceError(error.toString()));
    });
  }

  List<dynamic> technology = [];

  void getTechnology() {
    emit(GetTechnologyLoading());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'technology',
        'apiKey': '79c83924f52c4cc2bbcc9b34c9ad40d5',
      },
    ).then(
          (value) {
        technology = value.data['articles'];
        emit(GetTechnologySuccess());
      },
    ).catchError((error) {
      print(error.toString());
      emit(GetTechnologyError(error.toString()));
    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(GetSearchLoading());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '79c83924f52c4cc2bbcc9b34c9ad40d5',
      },
    ).then(
          (value) {
            search = value.data['articles'];
            emit(GetSearchSuccess());
      },
    ).catchError((error) {
      print(error.toString());
      emit(GetSearchError(error.toString()));
    });
  }

  bool isDark = false;

  void changeMode({bool mode}) {
    if (mode != null) {
      isDark = mode;
      emit(ChangeMode());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then(
            (value) {
          emit(ChangeMode());
        },
      );
    }
  }
}
