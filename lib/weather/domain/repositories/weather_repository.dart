
import 'package:clean_code/weather/core/error/failure.dart';
import 'package:clean_code/weather/domain/entity/weather_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository{
   Future<Either<Failure,WeatherEntity>> getCurrentWeather(String cityName);
}