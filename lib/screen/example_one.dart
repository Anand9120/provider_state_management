

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/provider/example_one_provider.dart';


class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  double value=1.0;
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<ExampleOneProvider>(context,listen: false);
    return Scaffold(appBar: AppBar(title: const Text('Example one'),),
      body:  Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<ExampleOneProvider>(builder: (context,value,child){
          return  Slider(max: 1,min: 0,
              value:provider.value, onChanged:(val){
                provider.setValue(val);

              });
        }),
       Consumer<ExampleOneProvider>(builder: (context,value,child){
         return  Row(
           children: [
             Expanded(child: Container(
               height: 100,
               decoration: BoxDecoration(color: Colors.orange.withOpacity(provider.value)),child: const Center(child: Text('B H',style: TextStyle(fontSize: 50),),),
             )),
             Expanded(child: Container(
               height: 100,
               decoration: BoxDecoration(color: Colors.white.withOpacity(provider.value)),child: const Center(child: Text('A R',style: TextStyle(fontSize: 50)),),
             )), Expanded(child: Container(
               height: 100,
               decoration: BoxDecoration(color: Colors.green.withOpacity(provider.value)),child: const Center(child: Text('A T',style: TextStyle(fontSize: 50)),),
             )),
           ],
         );
       })

      ],),
    );
  }
}
