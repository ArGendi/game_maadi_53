// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_13/cubits/game/game_cubit.dart';
import 'package:flutter_application_13/cubits/game/game_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GameCubit>(context).generateNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<GameCubit, GameState>(
                builder: (context, state){
                  if(state is SmallerState){
                    return Text(
                      'علي شوية',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    );
                  }
                  else if(state is BiggerState){
                    return Text(
                      "هدي شوية",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    );
                  }
                  else if(state is EqualState){
                    return Text(
                      "برافوووو عليييييك",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.green,
                      ),
                    );
                  }
                  else{
                    return Text(
                      "Guess number",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  if(textController.text.isNotEmpty){
                    int value = int.parse(textController.text);
                    BlocProvider.of<GameCubit>(context).checkNumber(value);
                    textController.clear();
                  }
                }, 
                child: Text("وريني"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}