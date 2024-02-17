
import 'package:flutter/material.dart';
import 'package:flutter_application_13/cubits/counter/counter_cubit.dart';
import 'package:flutter_application_13/cubits/counter/counter_states.dart';
import 'package:flutter_application_13/providers/counter_provider.dart';
import 'package:flutter_application_13/screens/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    var counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            }, 
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state){
                if(state is DoneState){
                  return Icon(Icons.check, size: 40, color: Colors.green,);
                }
                else if(state is CheckState){
                  return Text(
                    "Here we go..",
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
                else{
                  return Text(
                    counterCubit.counter.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
              },
            ),
            // Consumer<CounterProvider>(
            //   builder: (context, provider, _){
            //     return Text(
            //       provider.counter.toString(),
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     );
            //   },
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Provider.of<CounterProvider>(context, listen: false).increment();
          counterCubit.inc();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
