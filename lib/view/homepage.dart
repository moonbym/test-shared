import 'package:flutter/material.dart';
import 'package:newtest/control/providers/providers.dart';
import 'package:newtest/model/database/boxes/counterboxes.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<NumberState>().getcounter();

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
            Consumer<NumberState>(
              builder: (context, value, child) => Expanded(
                  child: ListView.builder(
                itemCount: NumberState.records.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Text(NumberState.records[index].number.toString()),
                  trailing: IconButton(
                      onPressed: () {
                        var key = Boxes.counterBox.keyAt(index);
                        context.read<NumberState>().remove(key);
                        context.read<NumberState>().getcounter();
                      },
                      icon: const Icon(Icons.remove)),
                  title: Column(
                    children: [
                      Text(NumberState.records[index].date),
                      Text(NumberState.records[index].id)
                    ],
                  ),
                ),
              )),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<NumberState>().minus();
              context.read<NumberState>().getcounter();
            },
            tooltip: 'decrease',
            child: const Icon(Icons.remove),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                context.read<NumberState>().reset();

                context.read<NumberState>().getcounter();
              },
              tooltip: 'reset',
              child: const Icon(Icons.restart_alt),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<NumberState>().plus();
              context.read<NumberState>().getcounter();
            },
            tooltip: 'increase',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
