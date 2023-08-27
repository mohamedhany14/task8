import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/cubit/cubit/counter/counter_cubit.dart';
import 'package:task8/cubit/cubit/replaceui/replaceui_cubit.dart';

class screen2 extends StatelessWidget {
  const screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      // CounterCubit().increment();

                      context.read<CounterCubit>().increment();
                    },
                    child: Text("+")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return Text(
                          context.read<CounterCubit>().counter.toString());
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                    },
                    child: Text("_"))
              ],
            ),
            SizedBox(
              height: 100,
            ),
            BlocBuilder<ReplaceuiCubit, ReplaceUiState>(
                builder: (context, state) {
              switch (state.runtimeType) {
                case ShowText:
                  return Text("Hello We Are ITI");

                case ShowCubitImage:
                  return SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        "https://pub.dev/packages/flutter_bloc/versions/8.1.3/gen-res/gen/190x190/logo.webp"),
                  );

                case ShowRedCircle:
                  return Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                  );

                default:
                  return Text(" No Button Clicked");
              }
            }),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<ReplaceuiCubit>().showText();
                },
                child: Text("Show text")),
            ElevatedButton(
                onPressed: () {
                  context.read<ReplaceuiCubit>().showCubitImage();
                },
                child: Text("Show cubit image")),
            ElevatedButton(
                onPressed: () {
                  context.read<ReplaceuiCubit>().showRedCircle();
                },
                child: Text("Show the red circle")),
            ElevatedButton(
                onPressed: () {
                  context.read<ReplaceuiCubit>().reset();
                },
                child: Text("Reset"))
          ],
        ),
      ),
    );
  }
}
