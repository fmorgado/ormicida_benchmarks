library ormicida.benchmarks.simpleInspector;

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:ormicida/codec.dart';

import '../_objects_dynamic.dart';

void main() {
  new _SimpleInspectorBench('short   ', shortObj).report();
  new _SimpleInspectorBench('short   ', shortObj).report();
  new _SimpleInspectorBench('short   ', shortObj).report();
  new _SimpleInspectorBench('short   ', shortObj).report();
  new _SimpleInspectorBench('medium  ', mediumObj).report();
  new _SimpleInspectorBench('medium  ', mediumObj).report();
  new _SimpleInspectorBench('medium  ', mediumObj).report();
  new _SimpleInspectorBench('medium  ', mediumObj).report();
  new _SimpleInspectorBench('large   ', longObj).report();
  new _SimpleInspectorBench('large   ', longObj).report();
  new _SimpleInspectorBench('large   ', longObj).report();
  new _SimpleInspectorBench('large   ', longObj).report();
}

const _LISTENER = const _VoidListener();
class _VoidListener implements CodecListener {
  const _VoidListener();
  void onListElement() {}
  void onListEnd() {}
  void onListStart() {}
  void onMapEnd() {}
  void onMapStart([String type]) {}
  void onPropertyEnd() {}
  void onPropertyStart(String name) {}
  void onValue(value) {}
}

class _SimpleInspectorBench extends BenchmarkBase {
  final object;
  _SimpleInspectorBench(String name, this.object): super(name);
  void run() {
    simpleInspector.inspect(object, _LISTENER);
  }
}
