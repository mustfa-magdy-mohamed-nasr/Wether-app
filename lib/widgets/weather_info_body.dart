import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    Key? key, required this.weatherModel,
  }) : super(key: key);
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text(
            " Updated at:${weatherModel.time.hour}",
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https:${weatherModel.image}',
              ),
              Text(
                weatherModel.temp.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Maxtemp: ${weatherModel.maxTemp.ceil()}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Mintemp: ${weatherModel.minTemp.ceil()}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap(32),
          Text(
            weatherModel.weatherCondition.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}
