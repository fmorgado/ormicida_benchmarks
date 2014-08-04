library ormicida.benchmarks.schema_encode;

import 'dart:convert' as convert;
import 'package:ormicida/orm/inspector.dart';
import 'package:ormicida_json/ormicida_json.dart';

import '_bench_utils.dart';
import '_bench_dynamic.dart';
import '_bench_schema.dart';
import '_objects_schema.dart';

void main() {
  //_testSchemas();
  _benchEncodersJson();
}

void _benchEncodersJson() {
  new BenchmarkSet('Encode Simple Json')
    ..add(new ConvertEncodeBench('dynamic convert', dynamicSimple))
    ..add(new JsonEncodeBench   ('dynamic json     map', dynamicSimple))
    ..add(new PixmEncodeBench   ('dynamic pixm     map', dynamicSimple))
    ..add(new Bson1EncodeBench  ('dynamic bson     map', dynamicSimple))
    ..add(new SchemaEncodeBench ('schema  map', dynamicSimple, json.encoder, MAP_SIMPLE_SCHEMA))
    ..add(new SchemaEncodeBench ('schema  mirror   mut', mutableSimple, json.encoder, MUT_SIMPLE_SCHEMA_MIRROR))
    ..add(new SchemaEncodeBench ('schema  closure  mut', mutableSimple, json.encoder, MUT_SIMPLE_SCHEMA_CLOSURE))
    ..add(new SchemaEncodeBench ('schema  closure2 mut', mutableSimple, json.encoder, MUT_SIMPLE_SCHEMA_CLOSURE_2))
    ..add(new SchemaEncodeBench ('schema  mirror   const', constantSimple, json.encoder, CONST_SIMPLE_SCHEMA_MIRROR))
    ..add(new SchemaEncodeBench ('schema  closure  const', constantSimple, json.encoder, CONST_SIMPLE_SCHEMA_CLOSURE))
    ..add(new SchemaEncodeBench ('schema  closure2 const', constantSimple, json.encoder, CONST_SIMPLE_SCHEMA_CLOSURE_2))
    ..report();
}

void _testSchemas() {
  _testSchema(dynamicSimple, MAP_SIMPLE_SCHEMA);
  _testSchema(mutableSimple, MUT_SIMPLE_SCHEMA_MIRROR);
  _testSchema(mutableSimple, MUT_SIMPLE_SCHEMA_CLOSURE);
  _testSchema(mutableSimple, MUT_SIMPLE_SCHEMA_CLOSURE_2);
  _testSchema(mutableSimple, MUT_SIMPLE_UNION);
  _testSchema(mutableSimple2, MUT_SIMPLE_UNION);
  _testSchema(mutableComplex, MUT_COMPLEX_SCHEMA);
}

void _testSchema(object, schema) {
  final bytes = inspector.encode(object, json.encoder, schema);
  final jsonString = convert.UTF8.decode(bytes);
  print(jsonString);
}
