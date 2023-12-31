import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/provider/count_provider.dart';
class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {

    super.initState();
    final countProvider=Provider.of<CountProvider>(context,listen: false);
    Timer.periodic(Duration(seconds: 2), (timer) {
      countProvider.setCount();
    });
  }
  @override
  Widget build(BuildContext context) {
    final countProvider=Provider.of<CountProvider>(context,listen: false);

    return Scaffold(appBar: AppBar(title: const Text('Provider')),
      body: Center(
          child:Consumer<CountProvider>(builder: (context,value,child){

        return
    Text(countProvider.count.toString(),style: const TextStyle(fontSize: 50),);
      },
      ))
        ,floatingActionButton: FloatingActionButton(onPressed: (
          ){
countProvider.setCount();
      },child: const Icon(Icons.add),
      )
      ,


    );
  }
}


