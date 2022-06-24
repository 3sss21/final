part of 'character_bloc.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}



class CharacterFetchedState extends CharacterState {
  final List<CharacterModel> model;
  CharacterFetchedState({required this.model});
}

class CharacterLoadingState extends CharacterState {}


class CharacterErrorState extends CharacterState {
   final CatchException error;
   CharacterErrorState({required this.error});
}