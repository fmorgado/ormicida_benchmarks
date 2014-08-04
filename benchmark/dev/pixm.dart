library ormicida.benchmarks.pixm;

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:ormicida_pixm/ormicida_pixm.dart';

import '../_objects_dynamic.dart';

void main() {
  //_runPixmOn('little', shortObj);
  //_runPixmOn('medium', mediumObj);
  //_runPixmOn('big', longObj);

  _runEncodeOn('little', shortObj);
  _runEncodeOn('medium', mediumObj);
  _runEncodeOn('big', longObj);
}

void _runDecodeOn(String name, object) {
  final bytes = pixm.encode(object);
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

void _runPixmOn(String name, object) {
  final bytes = pixm.encode(object);
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
    result = pixm.encode(object);
    if (result != null) _counter = 0;
  }
}

class _DynamicDecodeBench extends BenchmarkBase {
  final List<int> bytes;
  dynamic result;
  
  _DynamicDecodeBench(String name, this.bytes): super('Decode  $name');
  
  void run() {
    result = pixm.decode(bytes);
    if (result != null) _counter = 1;
  }
}

class _DynamicTotalBench extends BenchmarkBase {
  final               object;
  List<int>           bytes;
  var                 result;
  
  _DynamicTotalBench(String name, this.object): super('Total   $name');
  
  void run() {
    bytes = pixm.encode(object);
    result = pixm.decode(bytes);
    if (result != null) _counter = 2;
  }
}
