import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  bool isTodoDone = false;
  void Function(bool) checkTodoDoneTap;
  String contents = "";
  void Function() deleteTap;
  TodoTile({super.key, required this.isTodoDone, required this.checkTodoDoneTap, required this.contents,required this.deleteTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: isTodoDone == true ? Colors.blue : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              checkTodoDoneTap(isTodoDone == true ? false : true);
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                  isTodoDone == true
                      ? Icons.check_box
                      : Icons.check_box_outline_blank
              ),
            ),
          ),
          SizedBox(
            height: 30,
            width: 220,
            child: Text(
              contents
            ),
          ),
          GestureDetector(
            onTap: deleteTap,
            child: const SizedBox(
              height: 30,
              width: 30,
              child: Icon(Icons.delete),
            ),
          ),
        ],
      ),
    );
  }
}
