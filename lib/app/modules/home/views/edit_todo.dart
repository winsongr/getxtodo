import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:getxtodo/app/modules/home/controllers/todo_controller.dart';

import '../model/todo.dart';

class TodoEdit extends StatelessWidget {
  final int? index;
  final TodoController todoController = Get.find<TodoController>();

  TodoEdit({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
        TextEditingController(text: todoController.todos[index!].title);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Todo'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                    hintText: "",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none),
                style: TextStyle(fontSize: 25),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: () {
                    var editing = todoController.todos[index!];
                    editing.title = textEditingController.text;
                    todoController.todos[index!] = editing;
                    Get.back();
                  },
                  child: Text(
                    "update",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
