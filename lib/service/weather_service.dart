
import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService{
  final String url="https://api.weatherapi.com/v1";
  final String apiKey="8324e9cc41a54791a5a144416231012";
  Dio dio;
  WeatherService(this.dio);
  Future<WeatherModel> getWeather({required cityName})async{
   try {
  Response response= await dio.get("$url/forecast.json?key=$apiKey&q=$cityName&days=1");
  WeatherModel weatherModel= WeatherModel.fromjson(response.data);
   return weatherModel;
 
}  on DioException catch (e) {
 final String errorMassage=e.response?.data["error"]["massage"]??"oops ther was an error";
 throw Exception(errorMassage);
}catch(e){
  throw Exception("tray leetar");

}
   
  }
}