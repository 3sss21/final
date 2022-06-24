import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_56/bloc/character_bloc.dart';
import 'package:flutter_application_56/const/commands.dart';
import 'package:flutter_application_56/widgets/tittle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharacterInfo extends StatefulWidget {
  final String image;
  final String name;
  final String isAlive;
  final String? description;
  final String gender;
  final String race;
  final String location;
  final String origin;
  const CharacterInfo({
    Key? key,
    required this.origin,
    required this.image,
    required this.name,
    required this.isAlive,
    this.description,
    required this.gender,
    required this.race,
    required this.location,
  }) : super(key: key);

  @override
  State<CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo> {
  late CharacterBloc characterBloc;

  @override
  void initState() {
    characterBloc = CharacterBloc();
    characterBloc.add(GetCharacterEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ThemeHelper.white,
          ),
        ),
      ),
      body: BlocConsumer<CharacterBloc, CharacterState>(
          bloc: characterBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is CharacterLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CharacterErrorState) {}
            if (state is CharacterFetchedState) {
              return Stack(
                fit: StackFit.passthrough,
                children: [
                  Container(
                    width: 375.w,
                    height: 218.h,
                    child: ClipRRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 160.h,
                    left: 130.w,
                    child: CircleAvatar(
                      radius: 70.r,
                      backgroundImage: NetworkImage(widget.image),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 308, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.name,
                          style: TextHelper.large34w400,
                        ),
                        Text(
                          widget.isAlive,
                          style: TextHelper.small10.copyWith(
                            color: ThemeHelper.green,
                          ),
                        ),
                        // Text(widget.description!, style: TextHelper.small13),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 24, right: 121, left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Titles(title: 'Gender'),
                                  Text(
                                    widget.gender,
                                  ),
                                ],
                              ),
                              SizedBox(width: 80.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Titles(title: 'Species'),
                                  Text(
                                    widget.race,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 12.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Titles(title: 'Место рождения'),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 15,
                                  ),
                                ],
                              ),
                              Text(widget.origin),
                            ],
                          ),
                        ),
                        Divider(height: 60),
                       Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 12.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Titles(title: 'Местоположение'),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 15,
                                  ),
                                ],
                              ),
                              Text(widget.location),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return SizedBox();
          }),
    );
  }
}
