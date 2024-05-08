import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

import 'search_view.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor, // استخدام اللون الرئيسي هنا
            title: const Text('Weather App'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SearchView();
                  }));
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: BlocBuilder<GetWeatherCubit, WeatherState>(
              builder: (context, state) {
            if (state is WeatherInitialState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody(
                weatherModel: state.weatherModel,
              );
            } else {
              return const Text('Opse Ther Was an error');
            }
          })),
    );
  }
}
