import 'package:bloc/bloc.dart';
import 'package:flutter_application_56/bloc/character_repository.dart';
import 'package:flutter_application_56/helper/errors.dart';
import 'package:flutter_application_56/models/model.dart';
import 'package:meta/meta.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()) {
    on<CharacterEvent>((event, emit) async {
      if (event is GetCharacterEvent) {
        emit(CharacterLoadingState());
        try {
          List<CharacterModel> characterModelList =
              await PersonRpepository().getPerson();

          emit(CharacterFetchedState(model: characterModelList));
        } catch (e) {
          emit(CharacterErrorState(error: CatchException.convertException(e)));
        }
      }
    });
  }
}