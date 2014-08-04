library ormicida.benchmarks._objects_schema;

import 'package:ormicida/orm/schema.dart';
import 'package:ormicida/orm/mirror_schema.dart';

final dynamicSimple = {
  'v1': false,
  'v2': true,
  'v3': 45,
  'v4': 56.67,
  'v5': 'Some String 1',
  'v6': 'Some String 2'
};

final dynamicSimple2 = {
  'v1': true,
  'v2': 0
};

final mutableSimple = new MutSimple.fromJson(dynamicSimple);

final mutableSimple2 = new MutSimple2.fromJson(dynamicSimple2);

final constantSimple = new ConstSimple.fromJson(dynamicSimple);

class MutSimple {
  bool    v1;
  bool    v2;
  int     v3;
  num     v4;
  String  v5;
  String  v6;
  
  MutSimple({this.v1, this.v2, this.v3, this.v4, this.v5, this.v6});
  
  MutSimple.fromJson(Map json):
    v1 = json['v1'],
    v2 = json['v2'],
    v3 = json['v3'],
    v4 = json['v4'],
    v5 = json['v5'],
    v6 = json['v6'];
  
  Map toJson() => {
    'v1': v1,
    'v2': v2,
    'v3': v3,
    'v4': v4,
    'v5': v5,
    'v6': v6
  };
  
  operator ==(other) =>
      other is MutSimple
        && v1 == other.v1
        && v2 == other.v2
        && v3 == other.v3
        && v4 == other.v4
        && v5 == other.v5
        && v6 == other.v6;
  
  String toString() => 'MutSimple(v1="$v1", v2="$v2", v3="$v3", v4="$v4", v5="$v5", v6="$v6")';
}

class MutSimple2 {
  bool  v1;
  int   v2;
  
  MutSimple2({this.v1, this.v2});
  
  MutSimple2.fromJson(Map json):
    v1 = json['v1'],
    v2 = json['v2'];
  
  Map toJson() => {
    'v1': v1,
    'v2': v2
  };
  
  operator ==(other) =>
      other is MutSimple2
        && v1 == other.v1
        && v2 == other.v2;
  
  String toString() => 'MutSimple2(v1="$v1", v2="$v2")';
}

final MUT_SIMPLE_2_SCHEMA_CLOSURE = new IsObject.mutable(<ClassField>[
  new ClassField('v1', const IsBool(), (MutSimple2 target) => target.v1, (MutSimple2 target, bool value) { target.v1 = value; }),
  new ClassField('v2', const IsInt(), (MutSimple2 target) => target.v2, (MutSimple2 target, int value) { target.v2 = value; })
], () => new MutSimple2());

final MUT_SIMPLE_UNION = new IsUnion(<SchemaAlias>[
  new SchemaAlias('mut1', MutSimple, MUT_SIMPLE_SCHEMA_CLOSURE_2),
  new SchemaAlias('mut2', MutSimple2, MUT_SIMPLE_2_SCHEMA_CLOSURE),
  new SchemaAlias('const', ConstSimple, CONST_SIMPLE_SCHEMA_CLOSURE),
]);

const MAP_SIMPLE_SCHEMA = const IsObject(const <MapField>[
  const MapField('v1', const IsBool()),
  const MapField('v2', const IsBool()),
  const MapField('v3', const IsInt()),
  const MapField('v4', const IsNum()),
  const MapField('v5', const IsString()),
  const MapField('v6', const IsString())
]);

MutSimple _newMutSimple() => new MutSimple();
const MUT_SIMPLE_SCHEMA_MIRROR = const IsObject(const <MirrorField>[
  const MirrorField('v1', #v1, const IsBool()),
  const MirrorField('v2', #v2, const IsBool()),
  const MirrorField('v3', #v3, const IsInt()),
  const MirrorField('v4', #v4, const IsNum()),
  const MirrorField('v5', #v5, const IsString()),
  const MirrorField('v6', #v6, const IsString()),
], constructor: _newMutSimple);

bool _mutSimpleGetV1(MutSimple target) => target.v1;
bool _mutSimpleGetV2(MutSimple target) => target.v2;
int _mutSimpleGetV3(MutSimple target) => target.v3;
num _mutSimpleGetV4(MutSimple target) => target.v4;
String _mutSimpleGetV5(MutSimple target) => target.v5;
String _mutSimpleGetV6(MutSimple target) => target.v6;
void _mutSimpleSetV1(MutSimple target, bool value) { target.v1 = value; }
void _mutSimpleSetV2(MutSimple target, bool value) { target.v2 = value; }
void _mutSimpleSetV3(MutSimple target, int value) { target.v3 = value; }
void _mutSimpleSetV4(MutSimple target, num value) { target.v4 = value; }
void _mutSimpleSetV5(MutSimple target, String value) { target.v5 = value; }
void _mutSimpleSetV6(MutSimple target, String value) { target.v6 = value; }

const MUT_SIMPLE_SCHEMA_CLOSURE = const IsObject.mutable(const <ClassField>[
  const ClassField('v1', const IsBool(), _mutSimpleGetV1, _mutSimpleSetV1),
  const ClassField('v2', const IsBool(), _mutSimpleGetV2, _mutSimpleSetV2),
  const ClassField('v3', const IsInt(), _mutSimpleGetV3, _mutSimpleSetV3),
  const ClassField('v4', const IsNum(), _mutSimpleGetV4, _mutSimpleSetV4),
  const ClassField('v5', const IsString(), _mutSimpleGetV5, _mutSimpleSetV5),
  const ClassField('v6', const IsString(), _mutSimpleGetV6, _mutSimpleSetV6)
], _newMutSimple);

final MUT_SIMPLE_SCHEMA_CLOSURE_2 = new IsObject.mutable(<ClassField>[
  new ClassField('v1', const IsBool(), (MutSimple target) => target.v1, (MutSimple target, bool value) { target.v1 = value; }),
  new ClassField('v2', const IsBool(), (MutSimple target) => target.v2, (MutSimple target, bool value) { target.v2 = value; }),
  new ClassField('v3', const IsInt(), (MutSimple target) => target.v3, (MutSimple target, int value) { target.v3 = value; }),
  new ClassField('v4', const IsNum(), (MutSimple target) => target.v4, (MutSimple target, num value) { target.v4 = value; }),
  new ClassField('v5', const IsString(), (MutSimple target) => target.v5, (MutSimple target, String value) { target.v5 = value; }),
  new ClassField('v6', const IsString(), (MutSimple target) => target.v6, (MutSimple target, String value) { target.v6 = value; })
], () => new MutSimple());

class ConstSimple {
  final bool    v1;
  final bool    v2;
  final int     v3;
  final num     v4;
  final String  v5;
  final String  v6;
  
  ConstSimple(this.v1, this.v2, this.v3, this.v4, this.v5, this.v6);
  
  ConstSimple.fromJson(Map json):
    v1 = json['v1'],
    v2 = json['v2'],
    v3 = json['v3'],
    v4 = json['v4'],
    v5 = json['v5'],
    v6 = json['v6'];
  
  Map toJson() => {
    'v1': v1,
    'v2': v2,
    'v3': v3,
    'v4': v4,
    'v5': v5,
    'v6': v6
  };
  
  operator ==(other) =>
      other is ConstSimple
        && v1 == other.v1
        && v2 == other.v2
        && v3 == other.v3
        && v4 == other.v4
        && v5 == other.v5
        && v6 == other.v6;
  
  String toString() => 'ConstSimple(v1="$v1", v2="$v2", v3="$v3", v4="$v4", v5="$v5", v6="$v6")';
}

ConstSimple _newConstSimple(Map json) => new ConstSimple.fromJson(json);
const CONST_SIMPLE_SCHEMA_MIRROR = const IsObject(const <MirrorFinalField>[
  const MirrorFinalField('v1', #v1, const IsBool()),
  const MirrorFinalField('v2', #v2, const IsBool()),
  const MirrorFinalField('v3', #v3, const IsInt()),
  const MirrorFinalField('v4', #v4, const IsNum()),
  const MirrorFinalField('v5', #v5, const IsString()),
  const MirrorFinalField('v6', #v6, const IsString()),
], finalizer: _newConstSimple);

bool _constSimpleGetV1(ConstSimple target) => target.v1;
bool _constSimpleGetV2(ConstSimple target) => target.v2;
int _constSimpleGetV3(ConstSimple target) => target.v3;
num _constSimpleGetV4(ConstSimple target) => target.v4;
String _constSimpleGetV5(ConstSimple target) => target.v5;
String _constSimpleGetV6(ConstSimple target) => target.v6;

const CONST_SIMPLE_SCHEMA_CLOSURE = const IsObject.immutable(const <ClassFinalField>[
  const ClassFinalField('v1', const IsBool(), _constSimpleGetV1),
  const ClassFinalField('v2', const IsBool(), _constSimpleGetV2),
  const ClassFinalField('v3', const IsInt(), _constSimpleGetV3),
  const ClassFinalField('v4', const IsNum(), _constSimpleGetV4),
  const ClassFinalField('v5', const IsString(), _constSimpleGetV5),
  const ClassFinalField('v6', const IsString(), _constSimpleGetV6)
], _newConstSimple);

final CONST_SIMPLE_SCHEMA_CLOSURE_2 = new IsObject.immutable(<ClassFinalField>[
  new ClassFinalField('v1', const IsBool(), (ConstSimple target) => target.v1),
  new ClassFinalField('v2', const IsBool(), (ConstSimple target) => target.v2),
  new ClassFinalField('v3', const IsInt(), (ConstSimple target) => target.v3),
  new ClassFinalField('v4', const IsNum(), (ConstSimple target) => target.v4),
  new ClassFinalField('v5', const IsString(), (ConstSimple target) => target.v5),
  new ClassFinalField('v6', const IsString(), (ConstSimple target) => target.v6)
], _newConstSimple);

final dynamicComplex = {
  'v1': true,
  'v2': 'haha',
  'v3': [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
  'v4': dynamicSimple,
  'v5': dynamicSimple2,
  'v6': [dynamicSimple2, dynamicSimple2, dynamicSimple2, dynamicSimple2, dynamicSimple2,
         dynamicSimple2, dynamicSimple2, dynamicSimple2, dynamicSimple2, dynamicSimple2]
};

final mutableComplex = new MutComplex.fromJson(dynamicComplex);

final MUT_COMPLEX_SCHEMA = new IsObject.mutable(<ClassField>[
  new ClassField('v1', const IsBool(),
      (MutComplex target) => target.v1,
      (MutComplex target, bool value) { target.v1 = value; }),
  new ClassField('v2', const IsString(),
      (MutComplex target) => target.v2,
      (MutComplex target, String value) { target.v2 = value; }),
  new ClassField('v3', const IsList(schema: const IsInt()),
      (MutComplex target) => target.v3,
      (MutComplex target, List<int> value) { target.v3 = value; }),
  new ClassField('v4', MUT_SIMPLE_SCHEMA_CLOSURE_2,
      (MutComplex target) => target.v4,
      (MutComplex target, MutSimple value) { target.v4 = value; }),
  new ClassField('v5', MUT_SIMPLE_2_SCHEMA_CLOSURE,
      (MutComplex target) => target.v5,
      (MutComplex target, MutSimple2 value) { target.v5 = value; }),
  new ClassField('v6', new IsList(schema: MUT_SIMPLE_2_SCHEMA_CLOSURE),
      (MutComplex target) => target.v6,
      (MutComplex target, List<MutSimple2> value) { target.v6 = value; }),
], () => new MutComplex());

class MutComplex {
  bool              v1;
  String            v2;
  List<int>         v3;
  MutSimple         v4;
  MutSimple2        v5;
  List<MutSimple2>  v6;
  
  MutComplex({this.v1, this.v2, this.v3, this.v4, this.v5, this.v6});
  
  MutComplex.fromJson(Map json):
    v1 = json['v1'],
    v2 = json['v2'],
    v3 = json['v3'],
    v4 = new MutSimple.fromJson(json['v4']),
    v5 = new MutSimple2.fromJson(json['v5']),
    v6 = (json['v6'] as List).map((m2json) => new MutSimple2.fromJson(m2json)).toList();
  
  Map toJson() => {
    'v1': v1,
    'v2': v2,
    'v3': v3,
    'v4': v4,
    'v5': v5,
    'v6': v6
  };
  
  operator ==(other) =>
      other is MutComplex
        && v1 == other.v1
        && v2 == other.v2
        && v3 == other.v3
        && v4 == other.v4
        && v5 == other.v5
        && v6 == other.v6;
  
  String toString() => 'MutComplex(v1="$v1", v2="$v2", v3="$v3", v4="$v4", v5="$v5", v6="$v6")';
}
