import 'package:dio/dio.dart';
import 'package:flutter_application_56/helper/errors.dart';

class ApiRequester{
  static  String url ="https://rickandmortyapi.com/api";

  Future<Dio> initDio() async{
    return Dio(
      BaseOptions(baseUrl: url,
      responseType: ResponseType.json,
      connectTimeout: 10000,
      receiveTimeout: 10000,
   
      )
      
    );
  }

  Future<Response> toGet (String url, {Map<String, dynamic>? param})async{
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: param);
    }catch(e){
      throw CatchException.convertException(e);
    }
  }
}