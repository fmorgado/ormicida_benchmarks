library ormicida.benchmarks.validator;

import 'package:ormicida/orm/schema.dart';
import 'package:ormicida/orm/validator.dart';

void main() {
  _testValidation(simpleMap1, SIMPLE_1_SCHEMA);
  _testValidation(simpleMap2, SIMPLE_2_SCHEMA);
  _testValidation(complexMap, COMPLEX_SCHEMA);
}

void _testValidation(value, Schema schema) {
  final result = validate(value, schema);
  print(result);
}

final simpleMap1 = {
  'v1': false,
  'v2': true,
  'v3': 45,
  'v4': 56.67,
  'v5': 'Some String 1'
};

final simpleMap2 = {
  'v1': true,
  'v2': 0
};

final complexMap = {
  'v1': true,
  'v2': 'haha',
  'v3': [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
  'v4': simpleMap1,
  'v5': simpleMap2,
  'v6': [simpleMap2, simpleMap2]
};

final SIMPLE_1_SCHEMA = new IsObject(<MapField>[
  new MapField('v1', const IsBool(), defaultValue: false),
  new MapField('v2', const IsBool(nullable: true)),
  new MapField('v3', const IsInt()),
  new MapField('v4', const IsNum()),
  new MapField('v5', const IsString())
]);

final SIMPLE_2_SCHEMA = new IsObject(<MapField>[
  new MapField('v1', const IsBool()),
  new MapField('v2', const IsInt())
]);

final COMPLEX_SCHEMA = new IsObject(<MapField>[
  new MapField('v1', const IsBool()),
  new MapField('v2', const IsString()),
  new MapField('v3', const IsList(schema: const IsInt())),
  new MapField('v4', SIMPLE_1_SCHEMA),
  new MapField('v5', SIMPLE_2_SCHEMA),
  new MapField('v6', new IsList(schema: SIMPLE_2_SCHEMA)),
]);
