abstract class AppStates {}

class AppInitialState extends AppStates{}

class AppChangeBottomNavState extends AppStates{}

class AppLoadingState extends AppStates{}

class AppGetBusinessSuccessState extends AppStates{}

class AppGetScienceSuccessState extends AppStates{}

class AppGetSportsSuccessState extends AppStates{}

class AppGetBusinessFailState extends AppStates{
  final String error;

  AppGetBusinessFailState(this.error);
}

class AppGetScienceFailState extends AppStates{
  final String error;

  AppGetScienceFailState(this.error);
}

class AppGetSportsFailState extends AppStates{
  final String error;

  AppGetSportsFailState(this.error);
}
class AppChangeModeState extends AppStates{}

