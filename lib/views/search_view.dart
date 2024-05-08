import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seach city"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            //  controller: cubit.controller,
            onSubmitted: (value) {
              var cubit = BlocProvider.of<GetWeatherCubit>(context);

              cubit.getWeatherrr(cityName: value);
              Navigator.pop(context);
            },
            style: const TextStyle(),
            decoration: InputDecoration(
              labelText: "Search",
              hintText: "Enter City Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
