import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_test/flutter_test.dart';

void setUpProviders(){
  setUp((){
    // Reinicia los providers del flutter meedu
    ProviderScope.clear();
  });
}