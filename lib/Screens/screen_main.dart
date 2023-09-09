import 'package:flutter/material.dart';

import 'Widgets/AddStudentWidget.dart';
import 'Widgets/ListStudentWidget.dart';

class screen_main extends StatelessWidget {
  const screen_main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
        AddStudentWidget(),
        const Expanded(child: ListStudentWidget())
      ],)),
    );
  }
}