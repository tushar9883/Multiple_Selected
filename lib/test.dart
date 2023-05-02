import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TestData extends StatefulWidget {
  const TestData({Key? key}) : super(key: key);

  @override
  State<TestData> createState() => _TestDataState();
}

class _TestDataState extends State<TestData> {
  List holder = [
    {"color": "red", "value": "#f00"},
    {"color": "green", "value": "#0f0"},
    {"color": "blue", "value": "#00f"},
    {"color": "cyan", "value": "#0ff"},
    {"color": "magenta", "value": "#f0f"},
    {"color": "yellow", "value": "#ff0"},
    {"color": "black", "value": "#000"}
  ];

  List collection = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: (collection.isNotEmpty)
          ? Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.only(bottom: 30),
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: const Center(child: Text("Send")),
                ),
              ],
            ).animate().fadeIn().scale(duration: 180.ms, curve: Curves.linear)
          : const SizedBox.shrink(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListView.builder(
            itemCount: holder.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: collection.contains(holder[index])
                      ? Colors.green
                      : Colors.grey,
                ),
                child: InkWell(
                  onTap: () {
                    if (collection.contains(holder[index])) {
                      collection.remove(holder[index]);
                    } else {
                      collection.add(holder[index]);
                    }
                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(holder[index]["color"]),
                      Text(holder[index]["value"]),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
