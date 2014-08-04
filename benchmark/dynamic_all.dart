library ormicida.benchmarks.dynamic_all;

import '_bench_dynamic.dart';
import '_bench_utils.dart';
import '_objects_dynamic.dart';

void main() {
  _runEncodeBench();
  _runDecodeBench();
  _runTotalBench();
}

void _runEncodeBench() {
  new EncodeBenchSet('little', shortObj).report();
  new EncodeBenchSet('medium', mediumObj).report();
  new EncodeBenchSet('big', longObj).report();
}

void _runDecodeBench() {
  new DecodeBenchSet('little', shortObj).report();
  new DecodeBenchSet('medium', mediumObj).report();
  new DecodeBenchSet('big', longObj).report();
}

void _runTotalBench() {
  new TotalBenchSet('little', shortObj).report();
  new TotalBenchSet('medium', mediumObj).report();
  new TotalBenchSet('big', longObj).report();
}

class EncodeBenchSet extends BenchmarkSet {
  EncodeBenchSet(String name, object): super('encode $name') {
    add(new PixmEncodeBench('pixm', object));
    add(new JsonEncodeBench('json', object));
    add(new Bson1EncodeBench('bson', object));
    add(new Bson2EncodeBench('bson2', object));
    add(new ConvertEncodeBench('convert', object));
  }
}

class DecodeBenchSet extends BenchmarkSet {
  DecodeBenchSet(String name, object): super('decode $name') {
    add(new PixmDecodeBench('pixm', object));
    add(new JsonDecodeBench('json', object));
    add(new Bson1DecodeBench('bson', object));
    add(new Bson2DecodeBench('bson2', object));
    add(new ConvertDecodeBench('convert', object));
  }
}

class TotalBenchSet extends BenchmarkSet {
  TotalBenchSet(String name, object): super('total $name') {
    add(new PixmTotalBench('pixm', object));
    add(new JsonTotalBench('json', object));
    add(new Bson1TotalBench('bson', object));
    add(new Bson2TotalBench('bson2', object));
    add(new ConvertTotalBench('convert', object));
  }
}
