import 'package:flutter/material.dart';
import 'package:flutter_application_13/cubits/counter/counter_cubit.dart';
import 'package:flutter_application_13/cubits/counter/counter_states.dart';
import 'package:flutter_application_13/providers/counter_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state){
                return Text(
                  BlocProvider.of<CounterCubit>(context).counter.toString(),
                  style: TextStyle(
                    fontSize: 30,
                  ),
                );
              },
            ),
            // Consumer<CounterProvider>(
            //   builder: (context, p, widget){
            //     return Text(
            //       p.counter.toString(),
            //       style: TextStyle(
            //         fontSize: 30,
            //       ),
            //     );
            //   },
            // ),
            TextButton(
              onPressed: (){
                BlocProvider.of<CounterCubit>(context).dec();
                //Provider.of<CounterProvider>(context, listen: false).decrement();
              }, 
              child: Text("minus 4"),
            )
          ],
        ),
      ),
    );
  }
}