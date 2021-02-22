import 'package:flutter_template/database/flutter_template_database.dart';
import 'package:get_it/get_it.dart';
import 'package:moor_inspector/moor_inspector.dart';

Future<void> addDatabaseInspector() async {
  final database = GetIt.I<FlutterTemplateDatabase>();

  final moorInspectorBuilder = MoorInspectorBuilder()
    ..bundleId = 'com.icapps.flutter_template'
    ..icon = 'flutter'
    ..addDatabase('flutter_template', database);

  final inspector = moorInspectorBuilder.build();

  await inspector.start();

  // ignore: avoid_print
  print('Starting moor inspector');
}
