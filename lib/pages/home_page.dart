// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/extra_data.dart';
import 'package:untitled/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Home Page'),
            ElevatedButton(
              onPressed: () {
                 FirstRoute(ExtraData(index:1)).go(context);
              },
              child: const Text('first page'),
            )
          ],
        ),
      ),
    );
  }
}
