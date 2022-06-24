import 'package:flutter/material.dart';
import 'package:flutter_application_56/const/commands.dart';

class Titles extends StatelessWidget {
  final String title;
  const Titles({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextHelper.small12.copyWith(color: ThemeHelper.gray),
    );
  }
}



