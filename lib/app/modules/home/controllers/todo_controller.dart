import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxtodo/app/modules/home/model/todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  @override
  void onInit() {
    List? storedTodos = GetStorage().read('todos');
    if (storedTodos != null) {
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }
    ever(todos, (_) {
      GetStorage().write('todos', todos.toList());
    });
    super.onInit();
  }
}
