abstract class NewsStates {}

class AppInitialState extends NewsStates{}
class AppBottomNavBarState extends NewsStates{}

class NewsGetSportsSuccessState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
  String? error;
  NewsGetSportsErrorState(this.error);
}
class NewsGetSportsLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
  String? error;
  NewsGetBusinessErrorState(this.error);
}
class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
  String? error;
  NewsGetScienceErrorState(this.error);
}
class NewsGetScienceLoadingState extends NewsStates{}


class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates{
  String? error;
  NewsGetSearchErrorState(this.error);
}
class NewsGetSearchLoadingState extends NewsStates{}