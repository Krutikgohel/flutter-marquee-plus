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
  double _velocity = 50.0;
  double _gap = 65.0;
  double _padding = 10.0;
  bool _usePause = false;
  bool _useAccel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marquee Plus Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10,),
            _buildControlPanel(),
            const Divider(),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  children: [
                     // 1. Horizontal Marquees (Vertically Stacked)
                     const Text('1. Horizontal (Short vs Long)', style: TextStyle(fontWeight: FontWeight.bold)),
                     const SizedBox(height: 8),
                     SizedBox(
                       height: 50,
                       child: _buildDemoCard(
                         Colors.red.shade50,
                         MarqueePlus(
                           text: 'Short Text',
                           velocity: _velocity,
                           gap: _gap,
                           padding: EdgeInsets.all(_padding),
                           pauseAfterRound: _usePause ? const Duration(seconds: 1) : Duration.zero,
                           accelerationDuration: _useAccel ? const Duration(seconds: 1) : Duration.zero,
                           decelerationDuration: _useAccel ? const Duration(seconds: 1) : Duration.zero,
                         )
                       ),
                     ),
                     const SizedBox(height: 8),
                     SizedBox(
                       height: 50,
                       child: _buildDemoCard(
                         Colors.red.shade100,
                         MarqueePlus(
                           text: 'This is a much longer text that will definitely overflow the container and trigger the scrolling animation automatically.',
                           velocity: _velocity,
                           gap: _gap,
                           padding: EdgeInsets.all(_padding),
                           crossAxisAlignment: CrossAxisAlignment.center,
                           pauseAfterRound: _usePause ? const Duration(seconds: 1) : Duration.zero,
                           accelerationDuration: _useAccel ? const Duration(seconds: 1) : Duration.zero,
                           decelerationDuration: _useAccel ? const Duration(seconds: 1) : Duration.zero,
                         )
                       ),
                     ),

                     const SizedBox(height: 20),

                     // 2. Vertical Marquees (Side by Side)
                     const Text('2. Vertical (Short vs Long)', style: TextStyle(fontWeight: FontWeight.bold)),
                     const SizedBox(height: 8),
                     SizedBox(
                       height: 110,
                       child: Row(
                         children: [
                           Expanded(
                             child: _buildDemoCard(
                               Colors.green.shade50,
                               MarqueePlus(
                                 text: 'Short\nText',
                                 scrollAxis: Axis.vertical,
                                 velocity: _velocity,
                                 gap: _gap,
                                 padding: EdgeInsets.all(_padding),
                                 pauseAfterRound: _usePause ? const Duration(seconds: 1) : Duration.zero,
                                 accelerationDuration: _useAccel ? const Duration(seconds: 1) : Duration.zero,
                                 decelerationDuration: _useAccel ? const Duration(seconds: 1) : Duration.zero,
                               )
                             )
                           ),
                           const SizedBox(width: 8),
                           Expanded(
                             child: _buildDemoCard(
                               Colors.green.shade100,
                               MarqueePlus(
                                 text: 'This is very big text in this box that overflows and automatically scrolls vertically. '
                                     'This extra line is added only to extend the length slightly so you can see the scrolling effect. ',
                                 scrollAxis: Axis.vertical,
                                 velocity: _velocity,
                                 gap: _gap,
                                 padding: EdgeInsets.all(_padding),
                                 pauseAfterRound: _usePause ? const Duration(seconds: 1) : Duration.zero,
                                 accelerationDuration: _useAccel ? const Duration(seconds: 1) : Duration.zero,
                                 decelerationDuration: _useAccel ? const Duration(seconds: 1) : Duration.zero,
                               )
                             )
                           ),
                         ],
                       ),
                     ),

                     const SizedBox(height: 20),

                     // 3. Horizontal & Vertical (Force Scroll)
                     const Text('3. Force Scroll (H & V)', style: TextStyle(fontWeight: FontWeight.bold)),
                     const SizedBox(height: 8),
                     SizedBox(
                       height: 110,
                       child: Row(
                         children: [
                           Expanded(
                             child: _buildDemoCard(
                               Colors.blue.shade50,
                               MarqueePlus(
                                 text: 'Forced Scroll',
                                 forceScroll: true,
                                 velocity: _velocity,
                                 gap: _gap,
                                 padding: EdgeInsets.all(_padding),
                                 pauseAfterRound: _usePause ? const Duration(seconds: 1) : Duration.zero,
                                 accelerationDuration: _useAccel ? const Duration(seconds: 1) : Duration.zero,
                                 decelerationDuration: _useAccel ? const Duration(seconds: 1) : Duration.zero,
                               )
                             )
                           ),
                           const SizedBox(width: 8),
                           Expanded(
                             child: _buildDemoCard(
                               Colors.orange.shade50,
                               MarqueePlus(
                                 text: 'Forced\nScroll',
                                 forceScroll: true,
                                 scrollAxis: Axis.vertical,
                                 velocity: _velocity,
                                 gap: _gap,
                                 padding: EdgeInsets.all(_padding),
                                 pauseAfterRound: _usePause ? const Duration(seconds: 1) : Duration.zero,
                                 accelerationDuration: _useAccel ? const Duration(seconds: 1) : Duration.zero,
                                 decelerationDuration: _useAccel ? const Duration(seconds: 1) : Duration.zero,
                               )
                             )
                           ),
                         ],
                       ),
                     ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDemoCard(Color color, Widget marquee) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      alignment: Alignment.centerLeft,
      clipBehavior: Clip.hardEdge,
      child: marquee,
    );
  }

  Widget _buildControlPanel() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
           children: [
              Expanded(child: _buildSlider('Velocity', _velocity, 10, 300, (v) => _velocity = v)),
              Expanded(child: _buildSlider('Gap', _gap, 0, 200, (v) => _gap = v)),
           ],
        ),
        Row(
           children: [
              Expanded(child: _buildSlider('Pad', _padding, 0, 100, (v) => _padding = v)),
              
              const SizedBox(width: 8),
              
              // Compact Switches
              Text('Pause', style: const TextStyle(fontSize: 10)),
              Transform.scale(
                scale: 0.7,
                child: Switch(
                  value: _usePause, 
                  onChanged: (v) => setState(() => _usePause = v),
                ),
              ),
              
              const SizedBox(width: 4),
              
              Text('Curve', style: const TextStyle(fontSize: 10)),
              Transform.scale(
                scale: 0.7,
                child: Switch(
                  value: _useAccel, 
                  onChanged: (v) => setState(() => _useAccel = v),
                ),
              ),
           ],
        ),
      ],
    );
  }
  
  Widget _buildSlider(String label, double val, double min, double max, Function(double) onChanged) {
    return Column(
      children: [
        Text('$label: ${val.toInt()}', style: const TextStyle(fontSize: 10)),
        Slider(
          value: val,
          min: min,
          max: max,
          onChanged: (v) => setState(() => onChanged(v)),
        ),
      ],
    );
  }
}
