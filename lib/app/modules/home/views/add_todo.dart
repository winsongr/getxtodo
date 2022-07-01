import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxtodo/app/modules/home/controllers/todo_controller.dart';
import 'package:getxtodo/app/modules/home/model/todo.dart';

import '../controllers/home_controller.dart';

class AddTodo extends GetView<HomeController> {
  TextEditingController textEditingController = TextEditingController();
  final TodoController todoController = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: "Add Task",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  style: TextStyle(fontSize: 25,color: Colors.black),
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
                      todoController.todos
                          .add(Todo(title: textEditingController.text));
                      Get.back();
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
