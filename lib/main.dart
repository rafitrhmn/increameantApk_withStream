import 'dart:async';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: IncreamentApk());
  }
}

class IncreamentApk extends StatefulWidget {
  IncreamentApk({super.key});

  @override
  State<IncreamentApk> createState() => _IncreamentApkState();
}

class _IncreamentApkState extends State<IncreamentApk> {
  // StreamController untuk mengelola aliran data
  final StreamController<int> _streamController = StreamController<int>();
  //inisialisasi nilai awal
  int _counter = 0;

  //function utk menambah nilai Counter
  void _increamentCounter() {
    _counter++;
    _streamController.sink.add(_counter); //nambah nilai ke dlm stream
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('buat');
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Streams. increcment angka"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //pakai stream builder
            StreamBuilder(
              stream: _streamController.stream,
              initialData: _counter,
              builder: (context, snapshot) {
                return Text(
                  'Nilai : ${snapshot.data}',
                  style: TextStyle(fontSize: 30),
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  _increamentCounter();
                },
                child: const Text("Tambah"))
          ],
        ),
      ),
    );
  }
}

// 