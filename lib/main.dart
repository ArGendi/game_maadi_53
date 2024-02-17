import 'package:flutter/material.dart';
import 'package:flutter_application_13/cubits/counter/counter_cubit.dart';
import 'package:flutter_application_13/cubits/game/game_cubit.dart';
import 'package:flutter_application_13/providers/counter_provider.dart';
import 'package:flutter_application_13/screens/game_screen.dart';
import 'package:flutter_application_13/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => CounterProvider()),
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => GameCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: GameScreen(),
      ),
    );
  }
}
