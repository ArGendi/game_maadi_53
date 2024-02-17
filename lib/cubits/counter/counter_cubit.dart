import 'package:bloc/bloc.dart';
import 'package:flutter_application_13/cubits/counter/counter_states.dart';

class CounterCubit extends Cubit<CounterState>{
  int counter = 0;
  CounterCubit() : super(InitCounter());


  void inc() async{
    counter++;
    emit(DoneState());
    await Future.delayed(Duration(seconds: 2));
    emit(CheckState());
    await Future.delayed(Duration(seconds: 2));
    emit(IncrementState());
  }

  void dec(){
    counter = counter - 4;
    emit(DecrementState());
  }
}
