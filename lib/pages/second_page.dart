// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Second Page with'),
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