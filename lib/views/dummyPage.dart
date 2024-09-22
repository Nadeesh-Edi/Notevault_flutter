import 'package:flutter/material.dart';
import 'package:note_vault_flutter/components/header.dart';
import 'package:note_vault_flutter/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DummyPage extends StatefulWidget {
  const DummyPage({super.key});

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  List<User> users = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        setState(() {
          isLoading = false;
          users = data.map((e) => User.fromMap(e)).toList();
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print("Failed to load users");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Failed to fetch data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Header(
        title: "Dummy Page",
        body: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeRotatingDots(
                    color: Colors.black, size: 50),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        users[index].name?.toString() ?? 'No name',
                        style: const TextStyle(color: Colors.black),
                      ));
                },
              ));
  }
}
