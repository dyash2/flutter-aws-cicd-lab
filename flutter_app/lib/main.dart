import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GreetScreen(),
    );
  }
}

class GreetScreen extends StatefulWidget {
  const GreetScreen({super.key});

  @override
  State<GreetScreen> createState() => _GreetScreenState();
}

class _GreetScreenState extends State<GreetScreen> {
  String greeting = "Fetching...";

  @override
  void initState() {
    super.initState();
    fetchGreeting();
  }

  Future<void> fetchGreeting() async {
    try {
      final response = await http.get(
       Uri.parse('http://13.234.75.102:3000/')
      );

      if (response.statusCode == 200) {
        setState(() {
          greeting = response.body;
        });
      } else {
        setState(() {
          greeting = 'Failed to load greeting';
        });
      }
    } catch (e) {
      setState(() {
        greeting = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello App")),
      body: Center(child: Text(greeting, style: const TextStyle(fontSize: 20))),
    );
  }
}
