import 'package:flutter/material.dart';
import 'package:hivedemo/db/functions/db_functions.dart';

import '../../db/model/data_model.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (BuildContext ctx, List<StudentModel> studentList, Widget? child){
      return ListView.separated(itemBuilder: (ctx, index){
        final data = studentList[index];
        return ListTile(
        title: Text(data.name),
        subtitle: Text(data.age),
        trailing: IconButton(onPressed: (){
          if (data.id !=null)
          {
            deleteStudent(data.id!);
          }
          },
          icon: Icon(Icons.delete_forever),
          color: Colors.redAccent,),
        );
      }, separatorBuilder: (ctx, index){
        return const Divider();
      }, itemCount: studentList.length);
      }
    );
  }
}