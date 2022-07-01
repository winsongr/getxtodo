import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtodo/app/modules/home/controllers/home_controller.dart';
import 'package:getxtodo/app/modules/home/controllers/todo_controller.dart';
import 'package:getxtodo/app/modules/home/views/edit_todo.dart';

import 'add_todo.dart';

class AllTodo extends GetView<HomeController> {
  final TodoController todoController = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Getx Todo")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTodo());
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Obx(
          () {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.amber,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (_) {
                    todoController.todos.removeAt(index);
                    Get.snackbar("Remove", "Task Deleted",
                        snackPosition: SnackPosition.BOTTOM);
                  },
                  child: ListTile(
                    title: Text(
                      todoController.todos[index].title!,
                      style: todoController.todos[index].done
                          ? TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough)
                          : TextStyle(color: Colors.black),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Get.to(TodoEdit(index: index));
                      },
                      icon: Icon(Icons.edit),
                    ),
                    leading: Checkbox(
                      value: todoController.todos[index].done,
                      onChanged: ((newvalue) {
                        var todo = todoController.todos[index];
                        todo.done = newvalue!;
                        todoController.todos[index] = todo;
                      }),
                    ),
                  ),
                );
              },
              itemCount: todoController.todos.length,
            );
          },
        ),
      ),
    );
  }
}
