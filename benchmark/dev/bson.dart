library ormicida.benchmarks.dev.bson;

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:ormicida_bson/ormicida_bson.dart';

import '../_objects_dynamic.dart';

/*
Decode  little(RunTime): 17.125780293364617 us.
Decode  little(RunTime): 16.78866429386878 us.
Decode  little(RunTime): 16.70090351888037 us.
Decode  little(RunTime): 16.76923850887931 us.
Decode  medium(RunTime): 395.335046451868 us.
Decode  medium(RunTime): 390.85401602501463 us.
Decode  medium(RunTime): 392.8501276762915 us.
Decode  medium(RunTime): 390.39625219597895 us.
Decode  big(RunTime): 19269.23076923077 us.
Decode  big(RunTime): 19346.153846153848 us.
Decode  big(RunTime): 19278.846153846152 us.
Decode  big(RunTime): 19346.153846153848 us.
*/

void main() {
  //_runTotalOn('little', shortObj);
  //_runTotalOn('medium', mediumObj);
  //_runTotalOn('big', longObj);

  _runDecodeOn('little', shortObj);
  _runDecodeOn('medium', mediumObj);
  _runDecodeOn('big', longObj);
}

void _runDecodeOn(String name, object) {
  final bytes = bson.encode(object);
  new _DynamicDecodeBench(name, bytes).report();
  new _DynamicDecodeBench(name, bytes).report();
  new _DynamicDecodeBench(name, bytes).report();
  new _DynamicDecodeBench(name, bytes).report();
}

void _runEncodeOn(String name, object) {
  new _DynamicEncodeBench(name, object).report();
  new _DynamicEncodeBench(name, object).report();
  new _DynamicEncodeBench(name, object).report();
  new _DynamicEncodeBench(name, object).report();
}

void _runTotalOn(String name, object) {
  final bytes = bson.encode(object);
  new _DynamicEncodeBench(name, object).report();
  new _DynamicDecodeBench(name, bytes).report();
  new _DynamicTotalBench(name, object).report();
}

int _counter = 0;

class _DynamicEncodeBench extends BenchmarkBase {
  final               object;
  List<int>           result;
  
  _DynamicEncodeBench(String name, this.object): super('Encode  $name');
  
  void run() {
    result = bson.encode(object);
    if (result != null) _counter = 0;
  }
}

class _DynamicDecodeBench extends BenchmarkBase {
  final List<int> bytes;
  dynamic result;
  
  _DynamicDecodeBench(String name, this.bytes): super('Decode  $name');
  
  void run() {
    result = bson.decode(bytes);
    if (result != null) _counter = 1;
  }
}

class _DynamicTotalBench extends BenchmarkBase {
  final               object;
  List<int>           bytes;
  var                 result;
  
  _DynamicTotalBench(String name, this.object): super('Total   $name');
  
  void run() {
    bytes = bson.encode(object);
    result = bson.decode(bytes);
    if (result != null) _counter = 2;
  }
}
