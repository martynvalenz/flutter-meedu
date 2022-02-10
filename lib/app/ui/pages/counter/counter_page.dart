import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'controller/counter_provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: counterProvider.read.generateDate,
            icon:const Icon(Icons.date_range)
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
              builder:(_,ref,buttonWidget){
                final counter = ref.select(counterProvider.select(
                    // (_) => _.counter >= 5
                    (_) => _.counter
                  )
                );
                return Column(
                  children: [
                    Text(
                      '$counter', 
                      style:const TextStyle(fontSize: 35)
                    ),
                    buttonWidget!
                  ],
                );
              },
              child: FloatingActionButton(
                child:const Icon(Icons.add),
                onPressed: counterProvider.read.increment
              ),
            ),
            Consumer(
              builder:(_,ref,__){
                final date = ref.select(counterProvider.select(
                    (_) => _.date
                  )
                );
                return Text(
                  date, 
                  style:const TextStyle(fontSize: 15)
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}