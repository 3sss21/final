import 'package:flutter_application_56/bloc/character_provider.dart';
import 'package:flutter_application_56/models/model.dart';

class PersonRpepository {
  // GraphQLClient _client = clientToQuery();
  Future<List<CharacterModel>> getPerson() async {
    CharacterProvider provider = CharacterProvider();
//  QueryResult result = await _client.query(
//       QueryOptions(
//         documentNode: gql(getPerosonsQuery)
//       )
    return provider.getPerson();
  }
}
