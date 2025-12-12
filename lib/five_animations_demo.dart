import 'package:flutter/material.dart';

class FiveAnimationsDemo extends StatefulWidget {
  const FiveAnimationsDemo({super.key});

  @override
  State<FiveAnimationsDemo> createState() => _FiveAnimationsDemoState();
}

class _FiveAnimationsDemoState extends State<FiveAnimationsDemo> {
  bool _isExpanded = false;
  bool _isOpaque = true;
  bool _isMoved = false;
  bool _isScaled = false;
  bool _isRotated = false;

  final Duration _duration = const Duration(milliseconds: 600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animasi Implisit'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),

      // SingleChildScrollView
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // animated container
            _buildHeader('1. AnimatedContainer '),
            _buildAnimatedContainer(),
            const SizedBox(height: 30),

            // animated opacity
            _buildHeader('2. AnimatedOpacity '),
            _buildAnimatedOpacity(),
            const SizedBox(height: 30),

            // animated positioned
            _buildHeader('3. AnimatedPositioned '),
            _buildAnimatedPositioned(),
            const SizedBox(height: 30),

            // animated scale
            _buildHeader('4. AnimatedScale '),
            _buildAnimatedScale(),
            const SizedBox(height: 30),

            // animated rotation
            _buildHeader('5. AnimatedRotation '),
            _buildAnimatedRotation(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Helper Header
  Widget _buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  // AnimatedContainer
  Widget _buildAnimatedContainer() {
    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: AnimatedContainer(
        duration: _duration,
        curve: Curves.easeInOut,
        width: _isExpanded ? 250 : 100,
        height: _isExpanded ? 100 : 50,
        decoration: BoxDecoration(
          color: _isExpanded ? Colors.indigo : Colors.cyan,
          borderRadius: BorderRadius.circular(_isExpanded ? 20 : 8),
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            // animasi warna
            duration: _duration,
            style: TextStyle(
              color: _isExpanded ? Colors.yellowAccent : Colors.white,
              fontWeight: FontWeight.bold,
            ),
            child: Text(_isExpanded ? 'Container Full' : 'Tap Me'),
          ),
        ),
      ),
    );
  }

  // --- 2. AnimatedOpacity ---
  Widget _buildAnimatedOpacity() {
    return GestureDetector(
      onTap: () => setState(() => _isOpaque = !_isOpaque),
      child: AnimatedOpacity(
        opacity: _isOpaque ? 1.0 : 0.0,
        duration: _duration,
        child: Container(
          width: 150,
          height: 50,
          color: Colors.pink,
          alignment: Alignment.center,
          child: const Text(
            'Fade In/Out',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  // animated positioned
  Widget _buildAnimatedPositioned() {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: _duration,
            curve: Curves.easeInQuad,
            left: _isMoved ? 200 : 10,
            top: 10,
            child: GestureDetector(
              onTap: () => setState(() => _isMoved = !_isMoved),
              child: Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Move Me',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // animated scale
  Widget _buildAnimatedScale() {
    return GestureDetector(
      onTap: () => setState(() => _isScaled = !_isScaled),
      child: AnimatedScale(
        scale: _isScaled ? 1.5 : 1.0,
        duration: _duration,
        curve: Curves.elasticOut,
        child: Container(
          width: 100,
          height: 50,
          color: Colors.teal,
          alignment: Alignment.center,
          child: const Text('Scale Me', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  // animated rotation
  Widget _buildAnimatedRotation() {
    return GestureDetector(
      onTap: () => setState(() => _isRotated = !_isRotated),
      child: AnimatedRotation(
        turns: _isRotated ? 2.0 : 0.0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutBack,
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.star, color: Colors.yellow, size: 40),
        ),
      ),
    );
  }
}
