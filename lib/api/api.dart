import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:covid19/model/model.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://corona.lmao.ninja')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/all")
  Future<Total> getAll();

  @GET("/countries")
  Future<List<Country>> getCountries();
}
