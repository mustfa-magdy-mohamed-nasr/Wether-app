// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
   WeatherModel? weatherModel;
  // TextEditingController controller = TextEditingController();
  getWeatherrr({required String cityName}) async {
    try {
      weatherModel = await WeatherService(Dio()).getWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
