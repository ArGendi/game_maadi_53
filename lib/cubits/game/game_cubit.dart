import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_13/cubits/game/game_state.dart';

class GameCubit extends Cubit<GameState>{
  late int number;
  GameCubit() : super(InitGameState());

  void generateNumber(){
    Random r = Random();
    number = r.nextInt(20) + 1;
    emit(GenerateRandomState());
  }

  void checkNumber(int value){
    if(value < number){
      emit(SmallerState());
    }
    else if(value > number){
      emit(BiggerState());
    }
    else{
      emit(EqualState());
    }
  }
}