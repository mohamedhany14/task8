import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/cubit/cubit/change%20selected%20value/change_selected_value_cubit.dart';
import 'package:task8/cubit/cubit/counter/counter_cubit.dart';
import 'package:task8/cubit/cubit/radiotoggle/radiotogle_cubit.dart';
import 'package:task8/cubit/cubit/replaceui/replaceui_cubit.dart';
import 'package:task8/cubit/cubit/showhidepass/showhidepass_cubit.dart';

import 'package:task8/screens/screen1.dart';
import 'package:task8/screens/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChangeSelectedValueCubit>(
          create: (BuildContext context) => ChangeSelectedValueCubit(),
        ),
        BlocProvider<ShowhidepassCubit>(
          create: (BuildContext context) => ShowhidepassCubit(),
        ),
        BlocProvider<RadiotogleCubit>(
          create: (BuildContext context) => RadiotogleCubit(),
        ),
        BlocProvider<ReplaceuiCubit>(
          create: (BuildContext context) => ReplaceuiCubit(),
        ),
        BlocProvider<CounterCubit>(
          create: (BuildContext context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // ignore: prefer_const_constructors
          home: screen1()),
    );
  }
}
