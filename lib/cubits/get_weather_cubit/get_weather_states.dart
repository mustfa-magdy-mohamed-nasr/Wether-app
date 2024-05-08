import 'package:weather_app/model/weather_model.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
   WeatherModel weatherModel;
  WeatherLoadedState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
  final String errormmseag;

  WeatherFailureState(this.errormmseag);
}
