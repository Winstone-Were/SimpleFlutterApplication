import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
       ElevatedButton(onPressed: _increment, child: Text('Increment')),
       const SizedBox(width: 16),
       Text('Count: $_counter')
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Button Tapped');
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.lightGreen[500],
        ),
        child: const Center(
          child: Text("Click Me"),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation Menu',
            onPressed: null,
          ),
          Expanded(child: title),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Seaarch',
            onPressed: null,
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        MyAppBar(
            title: Text(
          'Example Title',
          style: Theme.of(context).primaryTextTheme.titleLarge,
        )),
        const Expanded(
            child: Center(
          child: Column(
            children: [Counter(), Text("Hello World")],
          ),
        ))
      ],
    ));
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: 'My App',
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
}
