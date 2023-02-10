import 'package:first_day/data/data.dart';
import 'package:first_day/presentations/pages/widgets/todo_ile.dart';
import 'package:flutter/material.dart';
import 'package:first_day/presentations/widgets/appbar.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  var data = Data();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BasicAppBar(),
        GestureDetector(
          onTap: (){
            setState(() {
              data.addData({
                "isDone" : false,
                "contents" : "정환! 정환!"
              });
            });
          },
          child: Container(
            height: 40,
            width: double.infinity,
            color: Colors.amber,
            child: Center(
              child: Text("Add Todo List"),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
              itemBuilder: (BuildContext context, int index ){
                return TodoTile(
                  isTodoDone: data.data[index]["isDone"],
                  checkTodoDoneTap:(value){
                    setState(() {
                      data.data[index]["isDone"] = value;
                    });
                  },
                  contents: data.data[index]["contents"],
                  deleteTap: () {
                    setState(() {
                      data.removeData(index: index);
                    });
                  },
                );
              }
          ),
        ),
      ],
    );
  }
}
