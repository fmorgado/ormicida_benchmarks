
import 'package:ormicida/codec.dart';
import 'package:ormicida_json/ormicida_json.dart';
import 'package:ormicida_bson/ormicida_bson.dart';
import 'package:ormicida_pixm/ormicida_pixm.dart';

import '_bench_utils.dart';
import '_objects_dynamic.dart';

void main() {
  _runSizes();
}

void _runSizes() {
  _compareSizes('short', shortObj);
  _compareSizes('medium', mediumObj);
  _compareSizes('long', longObj);
}

void _compareSizes(String name, object) {
  new BenchmarkSet(name)
    ..add(new _CodecSizeBench('json', object, json))
    ..add(new _CodecSizeBench('bson', object, bson))
    ..add(new _CodecSizeBench('pixm', object, pixm))
    ..report();
}

class _CodecSizeBench extends BenchmarkBase {
  final             object;
  final SchemaCodec codec;
  _CodecSizeBench(String name, this.object, this.codec): super(name);
  double measure() => codec.encode(object).length.toDouble();
}
