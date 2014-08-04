library ormicida.benchmarks._benchUtils;

import 'package:benchmark_harness/benchmark_harness.dart';
export 'package:benchmark_harness/benchmark_harness.dart';

class _Score {
  final String  name;
  final double  time;
  double        ratio;
  
  _Score(this.name, this.time);
  
  void _pad(StringBuffer buffer, int code, int length) {
    while (length-- > 0) buffer.writeCharCode(code);
  }
  void _padLeft(StringBuffer buffer, String label, int length) {
    _pad(buffer, 32, length - label.length);
    buffer.write(label);
  }
  void _padRight(StringBuffer buffer, String label, int length) {
    buffer.write(label);
    _pad(buffer, 32, length - label.length);
  }
  
  void _printValue(double value, int maxLen) {
    final buffer = new StringBuffer();
    buffer.write('  ');
    _padRight(buffer, name, maxLen + 2);
    _padLeft(buffer, value.toStringAsFixed(2), 12);
    print(buffer.toString());
  }
  
  void printTime(int maxLen) {
    _printValue(time, maxLen);
  }
  
  void printRatio(int maxLen) {
    _printValue(ratio, maxLen);
  }
}

class BenchmarkSet {
  final String name;
  final _benchs = <BenchmarkBase>[];
  
  BenchmarkSet(this.name);
  
  void add(BenchmarkBase bench) {
    _benchs.add(bench);
  }
  
  void report({bool sort: true}) {
    print('###########  $name');
    
    final maxLen = _benchs.fold(0,
        (int current, BenchmarkBase bench) {
          final length = bench.name.length;
          return length > current ? length : current;
        });
    final scores = <_Score>[];
    double minTime = double.MAX_FINITE;
    
    _benchs.forEach((bench) {
      final time = bench.measure();
      final score = new _Score(bench.name, time);
      
      if (time < minTime) minTime = time;
      scores.add(score);
      
      score.printTime(maxLen);
    });
    
    print('');
    
    if (sort) {
      scores.sort((score1, score2) => score1.time.compareTo(score2.time));
    }
    
    scores.forEach((score) {
      score.ratio = score.time / minTime;
      score.printRatio(maxLen);
    });
    
    print('');
  }
}


