library ormicida.benchmarks.dev.json;

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:ormicida_json/ormicida_json.dart';

import '../_objects_dynamic.dart';

/*
Decode  little(RunTime): 22.424541418127998 us.
Decode  little(RunTime): 22.230867559606512 us.
Decode  little(RunTime): 22.29579835679966 us.
Decode  little(RunTime): 22.317692350610947 us.
Decode  medium(RunTime): 474.8338081671415 us.
Decode  medium(RunTime): 474.158368895211 us.
Decode  medium(RunTime): 473.4848484848485 us.
Decode  medium(RunTime): 471.5868898844612 us.
Decode  big(RunTime): 23034.48275862069 us.
Decode  big(RunTime): 22954.545454545456 us.
Decode  big(RunTime): 23000.0 us.
Decode  big(RunTime): 22954.545454545456 us.
*/

void main() {
  //_runJsonOn('little', shortObj);
  //_runJsonOn('medium', mediumObj);
  //_runJsonOn('big', longObj);

  _runDecodeOn('little', shortObj);
  _runDecodeOn('medium', mediumObj);
  _runDecodeOn('big', longObj);
}

void _runDecodeOn(String name, object) {
  final bytes = json.encode(object);
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

void _runJsonOn(String name, object) {
  final bytes = json.encode(object);
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
    result = json.encode(object);
    if (result != null) _counter = 0;
  }
}

class _DynamicDecodeBench extends BenchmarkBase {
  final List<int> bytes;
  dynamic result;
  
  _DynamicDecodeBench(String name, this.bytes): super('Decode  $name');
  
  void run() {
    result = json.decode(bytes);
    if (result != null) _counter = 1;
  }
}

class _DynamicTotalBench extends BenchmarkBase {
  final               object;
  List<int>           bytes;
  var                 result;
  
  _DynamicTotalBench(String name, this.object): super('Total   $name');
  
  void run() {
    bytes = json.encode(object);
    result = json.decode(bytes);
    if (result != null) _counter = 2;
  }
}
