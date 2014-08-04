library ormicida.benchmarks.schema_decode;

import 'dart:convert' as convert;

const JSON_COMPLEX = r'{"v1":true,"v2":"haha","v3":[0,1,2,3,4,5,6,7,8,9],"v4":{"v1":false,"v2":true,"v3":45,"v4":56.67,"v5":"Some String 1","v6":"Some String 2"},"v5":{"v1":true,"v2":0},"v6":[{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0},{"v1":true,"v2":0}]}';
final JSON_COMPLEX_BYTES = convert.UTF8.encode(JSON_COMPLEX);

void main() {
  final object = convert.JSON.decode(convert.UTF8.decode(JSON_COMPLEX_BYTES));
  print(object);
}
