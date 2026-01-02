import 'package:flutter/material.dart';
import 'package:flutter_marquee_plus/flutter_marquee_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marquee Plus Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MarqueePlusDemo(),
    );
  }
}

class MarqueePlusDemo extends StatefulWidget {
  const MarqueePlusDemo({super.key});

  @override
  State<MarqueePlusDemo> createState() => _MarqueePlusDemoState();
}

class _MarqueePlusDemoState extends State<MarqueePlusDemo> {
  /// Controls the scrolling speed of the marquee widgets.
  double _velocity = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marquee Plus Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Shows the current velocity value.
              Text('Current Velocity: ${_velocity.toStringAsFixed(1)}'),

              /// Slider to dynamically adjust marquee velocity.
              Slider(
                value: _velocity,
                min: 10.0,
                max: 300.0,
                onChanged: (value) {
                  setState(() {
                    _velocity = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              /// Example 1: Short text that does not overflow → remains static.
              const Text('1. Default behavior (Short Text — Static)'),
              const SizedBox(height: 10),
              Container(
                color: Colors.grey[200],
                height: 50,
                alignment: Alignment.centerLeft,
                child: MarqueePlus(
                  text: 'Short Text',
                  velocity: _velocity,
                  style: const TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),

              const SizedBox(height: 30),

              /// Example 2: Long text that overflows → scrolls automatically.
              const Text('2. Default behavior (Long Text — Scroll)'),
              const SizedBox(height: 10),
              Container(
                color: Colors.grey[200],
                height: 50,
                alignment: Alignment.centerLeft,
                child: MarqueePlus(
                  text:
                      'This is a very long text that should scroll because it overflows the container width. ',
                  velocity: _velocity,
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
              ),

              const SizedBox(height: 30),

              /// Example 3: Short text forced to scroll using alwaysScroll = true.
              const Text('3. Forced scroll (Short Text — alwaysScroll = true)'),
              const SizedBox(height: 10),
              Container(
                color: Colors.grey[200],
                height: 50,
                alignment: Alignment.centerLeft,
                child: MarqueePlus(
                  text: 'Short Text',
                  velocity: _velocity,
                  alwaysScroll: true,
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                ),
              ),

              const SizedBox(height: 30),

              /// Example 4: Applying a custom animation curve.
              const Text('4. Custom Curve (Curves.easeInOut)'),
              const SizedBox(height: 10),
              Container(
                color: Colors.grey[200],
                height: 50,
                alignment: Alignment.centerLeft,
                child: MarqueePlus(
                  text:
                      'This text accelerates and decelerates due to the curve.',
                  velocity: _velocity,
                  curve: Curves.easeInOut,
                  style: const TextStyle(fontSize: 20, color: Colors.orange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
