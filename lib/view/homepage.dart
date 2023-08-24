import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/control/providers/providers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<NumberState>().getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<NumberState>(
              builder: (context, value, child) => Text(
                NumberState.counter.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<NumberState>().plus();
            },
            tooltip: 'increase',
            child: const Icon(Icons.add),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: FloatingActionButton(
              onPressed: () {
                context.read<NumberState>().minus();
              },
              tooltip: 'decrease',
              child: const Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
