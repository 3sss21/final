import 'package:flutter/material.dart';
import 'package:flutter_application_56/bloc/character_bloc.dart';
import 'package:flutter_application_56/const/commands.dart';
import 'package:flutter_application_56/screens/character_info.dart';
import 'package:flutter_application_56/widgets/statusColor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:auto_route/auto_route.dart';

class Character extends StatefulWidget {
  const Character({Key? key}) : super(key: key);

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  CharacterBloc characterBloc = CharacterBloc();

  @override
  void initState() {
    characterBloc = CharacterBloc();
    characterBloc.add(GetCharacterEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeHelper.white,
      ),
      body: BlocConsumer<CharacterBloc, CharacterState>(
        listener: (context, state) {},
        bloc: characterBloc,
        builder: (context, state) {
          if (state is CharacterLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CharacterErrorState) {
            return Center(
              child: ElevatedButton(
                onPressed: () => characterBloc.add(GetCharacterEvent()),
                child: const Text('Try Again'),
              ),
            );
          }
          if (state is CharacterFetchedState) {
            return SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    width: 1.sw,
                    height: 1.sh,
                    child: ListView.builder(
                        itemCount: state.model.length,
                        itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(bottom: 24),
                              child: InkWell(
                                  onTap: () {
                              //  ExtendedNavigator.root.push("route name");
                                    

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CharacterInfo(
                                            image: state.model[index].image!,
                                            name: state.model[index].name ??
                                                "unknown",
                                            isAlive: state.model[index].status!,
                                            gender: state.model[index].gender!,
                                            origin: state.model[index].origin
                                                    ?.name ??
                                                "unnknown",
                                            race: state.model[index].species!,
                                            location: state.model[index]
                                                    .location?.name ??
                                                "Unknown"),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 74.w,
                                        height: 74.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  state.model[index].image!,
                                                ),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        width: 18.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 9.h,
                                          ),
                                          Text(state.model[index].status!,
                                              style: TextStyle(
                                                  color: getStatusColor(state
                                                      .model[index].status!))),
                                          Text(
                                            state.model[index].name ??
                                                "unknown",
                                            style: TextHelper.medium16.copyWith(
                                                color: ThemeHelper.black),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "${state.model[index].species!},  ${state.model[index].gender!}",
                                                style: TextHelper.small12
                                                    .copyWith(
                                                        color:
                                                            ThemeHelper.gray),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )),
                            )),
                  ),
                ]),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
