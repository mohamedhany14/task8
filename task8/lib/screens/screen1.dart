import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/cubit/cubit/change%20selected%20value/change_selected_value_cubit.dart';
import 'package:task8/cubit/cubit/radiotoggle/radiotogle_cubit.dart';
import 'package:task8/cubit/cubit/showhidepass/showhidepass_cubit.dart';

class screen1 extends StatelessWidget {
  screen1({super.key});

  List<String> filterList = [
    "تمت",
    "تحت المراجعة",
    "المكتملة",
    "الملغية",
    "قيد التنفيذ",
    "اطلب مرة اخرى",
    "قيم الطلب",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              BlocBuilder<ChangeSelectedValueCubit, ChangeSelectedValueState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < filterList.length; i++)
                          InkWell(
                            onTap: () {
                              context
                                  .read<ChangeSelectedValueCubit>()
                                  .changeIndex(i);
                            },
                            child: Container(
                              margin: EdgeInsets.all(4),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: context
                                              .read<ChangeSelectedValueCubit>()
                                              .selectedindex ==
                                          i
                                      ? Colors.blue
                                      : Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Text(filterList[i]),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<ShowhidepassCubit, ShowhidepassState>(
                  builder: (context, state) {
                    return TextField(
                      obscureText: context.read<ShowhidepassCubit>().isShown,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: context.read<ShowhidepassCubit>().isShown
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            context.read<ShowhidepassCubit>().showhidepass();
                          },
                        ),
                        hintText: "Password",
                        // errorBorder: ,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 36, 4, 240), width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // border: ,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // border:
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 400,
                child: BlocBuilder<RadiotogleCubit, RadiotogleState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          value: index,
                          groupValue:
                              context.read<RadiotogleCubit>().currentval,
                          onChanged: (value) {
                            context.read<RadiotogleCubit>().togleradios(value);
                          },
                          title: Text("Title ${index + 1}"),
                          subtitle: Text("Hello we are ITI"),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
