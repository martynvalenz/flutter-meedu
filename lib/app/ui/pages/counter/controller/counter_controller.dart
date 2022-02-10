import 'package:flutter_meedu/meedu.dart';

class CounterController extends SimpleNotifier{
  int counter = 0;
  String date = '';

  CounterController(){
    print('CounterController');
  }

  void increment(){
    counter ++;
    notify();
  }

  void generateDate(){
    date = DateTime.now().toString();
    notify();
  }
}