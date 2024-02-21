import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/extra_data.dart';
import 'package:untitled/go_router.dart';
final _router = GoRouter(routes: $appRoutes,extraCodec: const MyExtraCodec());

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}


/// A codec that can serialize both [ComplexData1] and [ComplexData2].
class MyExtraCodec extends Codec<Object?, Object?> {
  /// Create a codec.
  const MyExtraCodec();
  @override
  Converter<Object?, Object?> get decoder => const _MyExtraDecoder();

  @override
  Converter<Object?, Object?> get encoder => const _MyExtraEncoder();
}

class _MyExtraDecoder extends Converter<Object?, Object?> {
  const _MyExtraDecoder();
  @override
  Object? convert(Object? input) {
    if (input == null) {
      return null;
    }
    log('hello decode');
    final List<Object?> inputAsList = input as List<Object?>;
    inputAsList.forEach((element) {
      
      log('element: $element');
    });
    if (inputAsList[0] == 'ExtraData') {
      return ExtraData(index: (inputAsList[1]! as int),);
    }
    throw FormatException('Unable tp parse input: $input');
  }
}

class _MyExtraEncoder extends Converter<Object?, Object?> {
  const _MyExtraEncoder();
  @override
  Object? convert(Object? input) {
    if (input == null) {
      return null;
    }
    log('hello ${input.runtimeType}');
    switch (input.runtimeType) {
      // ignore: type_literal_in_constant_pattern
      case ExtraData:
      log('hello saved');
        return <Object?>['ExtraData', (input as ExtraData).index];
      default:
        throw FormatException('Cannot encode type ${input.runtimeType}');
    }
  }
}
