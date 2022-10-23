import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Rest Api Demo',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todos = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getTodos();
  }

  getTodos() async {
    setState(() {
      isLoading = true;
    });

    try {
      var response = await http
          .get(Uri.parse('https://63542edbe64783fa8280de01.mockapi.io/todos/'));
      setState(() {
        todos = Todo.fromJasonList(jsonDecode(response.body) as List<dynamic>);
      });
    } catch (e) {
      print(e);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoading
          ? ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, itemIndex) => ListTile(
                title: Text(todos[itemIndex].title ?? ""),
                subtitle: Text(todos[itemIndex].description ?? ""),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
