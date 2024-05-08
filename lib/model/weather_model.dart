class WeatherModel {
  final String cityName;
  final String image;
  final DateTime time;
  final double minTemp;
  final double maxTemp;
  final double temp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.weatherCondition,
      required this.image,
      required this.time,
      required this.minTemp,
      required this.maxTemp,
      required this.temp});
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
      time: DateTime.parse(json["current"]["last_updated"]),
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
       image:json ['current']['condition']['icon'],
    );
  }
}
