import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HelloScreen(),
    );
  }
}

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  String message = "Loading...";

  @override
  void initState() {
    super.initState();
    fetchHello();
  }

  Future<void> fetchHello() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:3000/'), // use 10.0.2.2 for Android emulator
      );

      if (response.statusCode == 200) {
        setState(() {
          message = response.body;
        });
      } else {
        setState(() {
          message = 'Failed to load data';
        });
      }
    } catch (e) {
      setState(() {
        message = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello from Node.js")),
      body: Center(child: Text(message)),
    );
  }
}
