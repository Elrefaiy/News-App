abstract class AppStates {}

class InitialState extends AppStates{}

class ChangeBottomNavBarIndex extends AppStates{}

class ChangeCategoriesIndex extends AppStates{}

class GetAllNewsLoading extends AppStates{}

class GetAllNewsSuccess extends AppStates{}

class GetAllNewsError extends AppStates{
  String error;
  GetAllNewsError(this.error);
}

class GetBusinessLoading extends AppStates{}

class GetBusinessSuccess extends AppStates{}

class GetBusinessError extends AppStates{
  String error;
  GetBusinessError(this.error);
}

class GetSportsLoading extends AppStates{}

class GetSportsSuccess extends AppStates{}

class GetSportsError extends AppStates{
  String error;
  GetSportsError(this.error);
}

class GetScienceLoading extends AppStates{}

class GetScienceSuccess extends AppStates{}

class GetScienceError extends AppStates{
  String error;
  GetScienceError(this.error);
}

class GetTechnologyLoading extends AppStates{}

class GetTechnologySuccess extends AppStates{}

class GetTechnologyError extends AppStates{
  String error;
  GetTechnologyError(this.error);
}

class ChangeActiveIndex extends AppStates{}

class GetSearchLoading extends AppStates{}

class GetSearchSuccess extends AppStates{}

class GetSearchError extends AppStates{
  String error;
  GetSearchError(this.error);
}

class ChangeMode extends AppStates{}
