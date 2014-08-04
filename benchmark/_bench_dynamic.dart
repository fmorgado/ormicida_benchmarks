library ormicida.benchmarks._benchDynamic;

import 'dart:convert' as convert;
import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:ormicida_json/ormicida_json.dart';
import 'package:ormicida_pixm/ormicida_pixm.dart';
import 'package:bson/bson.dart' as bson2;
import 'package:ormicida_bson/ormicida_bson.dart' as bson1;

class JsonEncodeBench extends BenchmarkBase {
  final               object;
  List<int>           result;
  JsonEncodeBench(String name, this.object): super(name);
  void run() {
    result = json.encode(object);
  }
}

class JsonDecodeBench extends BenchmarkBase {
  final List<int> bytes;
  dynamic         result;
  JsonDecodeBench(String name, object)
      : bytes = json.encode(object), super(name);
  void run() {
    result = json.decode(bytes);
  }
}

class JsonTotalBench extends BenchmarkBase {
  final           object;
  dynamic         result;
  JsonTotalBench(String name, this.object): super(name);
  void run() {
    final bytes = json.encode(object);
    result = json.decode(bytes);
  }
}

class PixmEncodeBench extends BenchmarkBase {
  final               object;
  List<int>           result;
  PixmEncodeBench(String name, this.object): super(name);
  void run() {
    result = pixm.encode(object);
  }
}

class PixmDecodeBench extends BenchmarkBase {
  final List<int> bytes;
  dynamic         result;
  PixmDecodeBench(String name, object)
      : bytes = pixm.encode(object), super(name);
  void run() {
    result = pixm.decode(bytes);
  }
}

class PixmTotalBench extends BenchmarkBase {
  final           object;
  dynamic         result;
  PixmTotalBench(String name, this.object): super(name);
  void run() {
    final bytes = pixm.encode(object);
    result = pixm.decode(bytes);
  }
}

class Bson1EncodeBench extends BenchmarkBase {
  final               object;
  List<int>           result;
  Bson1EncodeBench(String name, this.object): super(name);
  void run() {
    result = bson1.bson.encode(object);
  }
}

class Bson1DecodeBench extends BenchmarkBase {
  final List<int> bytes;
  dynamic         result;
  Bson1DecodeBench(String name, object)
      : bytes = bson1.bson.encode(object), super(name);
  void run() {
    result = bson1.bson.decode(bytes);
  }
}

class Bson1TotalBench extends BenchmarkBase {
  final           object;
  dynamic         result;
  Bson1TotalBench(String name, this.object): super(name);
  void run() {
    final bytes = bson1.bson.encode(object);
    result = bson1.bson.decode(bytes);
  }
}

final bson2.BSON _bson2 = new bson2.BSON();

class Bson2EncodeBench extends BenchmarkBase {
  final             object;
  List<int>         result;
  Bson2EncodeBench(String name, this.object): super(name);
  void run() {
    result = _bson2.serialize(object).byteList;
  }
}

class Bson2DecodeBench extends BenchmarkBase {
  final List<int> bytes;
  dynamic         result;
  Bson2DecodeBench(String name, object)
      : bytes = _bson2.serialize(object).byteList, super(name);
  void run() {
    result = _bson2.deserialize(new bson2.BsonBinary.from(bytes));
  }
}

class Bson2TotalBench extends BenchmarkBase {
  final   object;
  dynamic result;
  Bson2TotalBench(String name, this.object): super(name);
  void run() {
    final bytes = _bson2.serialize(object).byteList;
    result = _bson2.deserialize(new bson2.BsonBinary.from(bytes));
  }
}

class ConvertEncodeBench extends BenchmarkBase {
  final             object;
  List<int>         result;
  ConvertEncodeBench(String name, this.object): super(name);
  void run() {
    result = convert.UTF8.encode(convert.JSON.encode(object));
  }
}

class ConvertDecodeBench extends BenchmarkBase {
  final List<int> bytes;
  dynamic         result;
  ConvertDecodeBench(String name, object)
      : bytes = convert.UTF8.encode(convert.JSON.encode(object)),
        super(name);
  void run() {
    result = convert.JSON.decode(convert.UTF8.decode(bytes));
  }
}

class ConvertTotalBench extends BenchmarkBase {
  final   object;
  dynamic result;
  ConvertTotalBench(String name, this.object): super(name);
  void run() {
    final bytes = convert.UTF8.encode(convert.JSON.encode(object));
    result = convert.JSON.decode(convert.UTF8.decode(bytes));
  }
}
