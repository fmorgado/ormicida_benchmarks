library ormicida.benchmarks.schema_decode;

import 'dart:convert' as convert;
import 'package:ormicida/orm/builder.dart';
import 'package:ormicida/orm/schema.dart';
import 'package:ormicida_json/ormicida_json.dart';
import 'package:ormicida_pixm/ormicida_pixm.dart';
import 'package:ormicida_bson/ormicida_bson.dart';

import '_bench_utils.dart';
import '_bench_dynamic.dart';
import '_bench_schema.dart';
import '_objects_schema.dart';

const JSON_SIMPLE = r'{"v1":false,"v2":true,"v3":45,"v4":56.67,"v5":"Some String 1","v6":"Some String 2"}';
const JSON_UNION_1 = r'{"$type":"mut1","v1":false,"v2":true,"v3":45,"v4":56.67,"v5":"Some String 1","v6":"Some String 2"}';
const JSON_UNION_2 = r'{"$type":"mut2","v1":true,"v2":0}';
const JSON_UNION_3 = r'{"$type":"const","v1":false,"v2":true,"v3":45,"v4":56.67,"v5":"Some String 1","v6":"Some String 2"}';
const JSON_COMPLEX = r'{"v1":true,"v2":"haha","v3":[0,1,2,3,4,5,6,7,8,9],"v4":{"v1":false,"v2":true,"v3":45,"v4":56.67,"v5":"Some String 1","v6":"Some String 2"},"v5":{"v1":true,"v2":0},"v6":[{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0}]}';

final JSON_SIMPLE_BYTES = convert.UTF8.encode(JSON_SIMPLE);
final JSON_UNION_1_BYTES = convert.UTF8.encode(JSON_UNION_1);
final JSON_UNION_2_BYTES = convert.UTF8.encode(JSON_UNION_2);
final JSON_UNION_3_BYTES = convert.UTF8.encode(JSON_UNION_3);
final JSON_COMPLEX_BYTES = convert.UTF8.encode(JSON_COMPLEX);

final TEST_SCHEMA = new IsList(schema: MUT_SIMPLE_2_SCHEMA_CLOSURE);
const JSON_TEST = r'[{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0}]';
final JSON_TEST_BYTES = convert.UTF8.encode(JSON_TEST);

void main() {
  //_testSchemas();
  _benchDecodersJson();
  _benchDecodersComplex();
}

void _benchDecodersJson() {
  new BenchmarkSet('Decode Simple Json')
    ..add(new ConvertDecodeBench('dynamic convert', dynamicSimple))
    ..add(new ConvertDecodeBench('dynamic convert', dynamicSimple))
    ..add(new JsonDecodeBench   ('dynamic json', dynamicSimple))
    //..add(new Bson1DecodeBench  ('dynamic bson', dynamicSimple))
    //..add(new PixmDecodeBench   ('dynamic pixm', dynamicSimple))
    ..add(new SchemaDecodeBench ('schema  dynamic', dynamicSimple, json, const IsDynamic()))
    ..add(new SchemaDecodeBench ('schema  map', dynamicSimple, json, MAP_SIMPLE_SCHEMA))
    ..add(new SchemaDecodeBench ('schema  mirror   mut', mutableSimple, json, MUT_SIMPLE_SCHEMA_MIRROR))
    ..add(new SchemaDecodeBench ('schema  closure  mut', mutableSimple, json, MUT_SIMPLE_SCHEMA_CLOSURE))
    ..add(new SchemaDecodeBench ('schema  closure2 mut', mutableSimple, json, MUT_SIMPLE_SCHEMA_CLOSURE_2))
    ..add(new SchemaDecodeBench ('schema  mirror   const', constantSimple, json, CONST_SIMPLE_SCHEMA_MIRROR))
    ..add(new SchemaDecodeBench ('schema  closure  const', constantSimple, json, CONST_SIMPLE_SCHEMA_CLOSURE))
    ..add(new SchemaDecodeBench ('schema  closure2 const', constantSimple, json, CONST_SIMPLE_SCHEMA_CLOSURE_2))
    ..report();
}

void _benchDecodersComplex() {
  new BenchmarkSet('Decode Complex Json')
    ..add(new ConvertDecodeBench('convert', dynamicComplex))
    ..add(new ConvertDecodeBench('convert', dynamicComplex))
    
    ..add(new ConvertDecodeSchemaBench('convert  validate', dynamicComplex, MUT_COMPLEX_SCHEMA))
    ..add(new ConvertDecodeSchemaBench('convert  validate', dynamicComplex, MUT_COMPLEX_SCHEMA))
    
    ..add(new JsonDecodeBench   ('dynamic json', dynamicComplex))
    ..add(new JsonDecodeBench   ('dynamic json', dynamicComplex))
    
    ..add(new PixmDecodeBench   ('dynamic pixm', dynamicComplex))
    ..add(new PixmDecodeBench   ('dynamic pixm', dynamicComplex))
    
    ..add(new Bson1DecodeBench  ('dynamic bson', dynamicComplex))
    ..add(new Bson1DecodeBench  ('dynamic bson', dynamicComplex))
    
    ..add(new SchemaDecodeBench ('schema  json', mutableComplex, json, MUT_COMPLEX_SCHEMA))
    ..add(new SchemaDecodeBench ('schema  json', mutableComplex, json, MUT_COMPLEX_SCHEMA))
    
    ..add(new SchemaDecodeBench ('schema  pixm', mutableComplex, pixm, MUT_COMPLEX_SCHEMA))
    ..add(new SchemaDecodeBench ('schema  pixm', mutableComplex, pixm, MUT_COMPLEX_SCHEMA))
    
    ..add(new SchemaDecodeBench ('schema  bson', mutableComplex, bson, MUT_COMPLEX_SCHEMA))
    ..add(new SchemaDecodeBench ('schema  bson', mutableComplex, bson, MUT_COMPLEX_SCHEMA))
    
    ..report();
}

void _testSchemas() {
  _testSchema(JSON_SIMPLE_BYTES, MAP_SIMPLE_SCHEMA);
  _testSchema(JSON_SIMPLE_BYTES, MUT_SIMPLE_SCHEMA_MIRROR);
  _testSchema(JSON_SIMPLE_BYTES, MUT_SIMPLE_SCHEMA_CLOSURE);
  _testSchema(JSON_SIMPLE_BYTES, MUT_SIMPLE_SCHEMA_CLOSURE_2);
  _testSchema(JSON_UNION_1_BYTES, MUT_SIMPLE_UNION);
  _testSchema(JSON_UNION_2_BYTES, MUT_SIMPLE_UNION);
  _testSchema(JSON_UNION_3_BYTES, MUT_SIMPLE_UNION);
  _testSchema(JSON_COMPLEX_BYTES, MUT_COMPLEX_SCHEMA);
}

void _testSchema(List<int> bytes, schema) {
  final object = builder.decode(bytes, json.decoder, schema);
  print(object);
}
