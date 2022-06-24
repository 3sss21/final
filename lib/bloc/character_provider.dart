import 'package:dio/dio.dart';
import 'package:flutter_application_56/helper/api_requester.dart';
import 'package:flutter_application_56/helper/errors.dart';
import 'package:flutter_application_56/models/model.dart';

class CharacterProvider {
  Future<List<CharacterModel>> getPerson() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet('/character');
      if (response.statusCode == 200) {
        List<CharacterModel> characterModelList = response.data["results"]
            .map<CharacterModel>((el) => CharacterModel.fromJson(el)).toList();
        return characterModelList;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
