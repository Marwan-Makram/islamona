import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tasbeeh extends StatefulWidget {
  const Tasbeeh({Key? key}) : super(key: key);

  @override
  State<Tasbeeh> createState() => _State();
}

class _State extends State<Tasbeeh> {
  late SharedPreferences _prefs;
  int counter = 0;
  final Color originalColor = Colors.green[800]!;
  final Color flashingColor = Colors.green[400]!;
  Color currentColor = Colors.green[800]!;

  @override
  void initState() {
    super.initState();
    loadCounter();
  }

  void loadCounter() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = _prefs.getInt('counter') ?? 0;
    });
  }

  void incrementCounter() {
    setState(() {
      counter++;
      _prefs.setInt('counter', counter);
      currentColor = flashingColor;
    });
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        currentColor = originalColor;
      });
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
      _prefs.setInt('counter', counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: Container(
          padding: EdgeInsets.only(bottom: 10, top: 3.0),
          child: Center(
            child: Text(
              "تسبيح",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    incrementCounter();
                  });
                },
                child: CircleAvatar(
                  radius: 120,
                  backgroundColor: currentColor,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.green,
                    child: Center(
                      child: Text(
                        "$counter",
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                "سبح",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    resetCounter();
                  });
                },
                icon: const Icon(Icons.restart_alt),
                color: Colors.lightGreen[900],
                iconSize: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
