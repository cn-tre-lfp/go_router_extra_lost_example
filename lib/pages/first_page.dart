// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/extra_data.dart';
import 'package:untitled/go_router.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key,required this.index});

  final ExtraData? index;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('First Page $index'),
            ElevatedButton(
              onPressed: () {
                const SecondRoute().go(context);
              },
              child: const Text('second page'),
            ),
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('back'),
            )
          ],
        ),
      ),
    );
  }
}