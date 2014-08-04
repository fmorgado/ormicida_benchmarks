library ormicida.benchmarks._bench_schema;

import 'package:benchmark_harness/benchmark_harness.dart';
import 'dart:convert' as convert;
import 'package:ormicida/orm/builder.dart';
import 'package:ormicida/orm/inspector.dart';
import 'package:ormicida/orm/validator.dart';
import 'package:ormicida/codec.dart';
import 'package:ormicida/orm/schema.dart';

class ConvertDecodeSchemaBench extends BenchmarkBase {
  final List<int> bytes;
  final Schema    schema;
  dynamic         result;
  ConvertDecodeSchemaBench(String name, object, this.schema)
      : bytes = convert.UTF8.encode(convert.JSON.encode(object)),
        super(name);
  void run() {
    result = validate(convert.JSON.decode(convert.UTF8.decode(bytes)), schema);
  }
}

class SchemaEncodeBench extends BenchmarkBase {
  final               object;
  final CodecEncoder  encoder;
  final Schema        schema;
  List<int>           result;
  SchemaEncodeBench(String name, this.object, this.encoder, this.schema)
      : super(name);
  void run() {
    result = inspector.encode(object, encoder, schema);
  }
}

class SchemaDecodeBench extends BenchmarkBase {
  final List<int>     bytes;
  final CodecDecoder  decoder;
  final Schema        schema;
  dynamic             result;
  SchemaDecodeBench(String name, object, SchemaCodec codec, Schema schema)
      : this.schema = schema,
        decoder = codec.decoder,
        bytes = inspector.encode(object, codec.encoder, schema),
        super(name);
  void run() {
    result = builder.decode(bytes, decoder, schema);
  }
}
