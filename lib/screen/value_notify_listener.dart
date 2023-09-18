import 'package:flutter/material.dart';
class NotifyListenerScreen extends StatefulWidget {
  const NotifyListenerScreen({super.key});


  @override
  State<NotifyListenerScreen> createState() => _NotifyListenerScreenState();
}

class _NotifyListenerScreenState extends State<NotifyListenerScreen> {
  final ValueNotifier<int> _counter=ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notify'),

      ),
      body:  Center(
         child: ValueListenableBuilder(valueListenable: _counter, builder: (context,value,child){
           return  Text(_counter.value.toString(),style: TextStyle(fontSize: 50),);

         }),
      ),floatingActionButton: FloatingActionButton(
      onPressed: (){
        _counter.value++;
        print(_counter.value.toString());
      },
      child: const Icon(Icons.add),
    ),
    );
  }
}
