import 'package:flutter/material.dart';

class AutomaticAnimationsScreen extends StatefulWidget {
  const AutomaticAnimationsScreen({super.key});

  @override
  State<AutomaticAnimationsScreen> createState() =>
      _AutomaticAnimationsScreenState();
}

class _AutomaticAnimationsScreenState extends State<AutomaticAnimationsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // Inisialisasi Animasi
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _fadeAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(_controller);
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.0, 0.0),
    ).animate(_controller);
    _colorAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.blue,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animasi Otomatis (Eksplisit)'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // rotation transition
            _buildHeader('1. RotationTransition'),
            RotationTransition(
              turns: _rotationAnimation,
              child: _buildBox(Colors.purple),
            ),
            const SizedBox(height: 30),

            // scale transition
            _buildHeader('2. ScaleTransition'),
            ScaleTransition(
              scale: _scaleAnimation,
              child: _buildBox(Colors.teal),
            ),
            const SizedBox(height: 30),

            // fade transition
            _buildHeader('3. FadeTransition '),
            FadeTransition(
              opacity: _fadeAnimation,
              child: _buildBox(Colors.pink),
            ),
            const SizedBox(height: 30),

            // animasi builder
            _buildHeader('4. AnimatedBuilder'),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    // animasi warna
                    color: _colorAnimation.value,
                    // nilai BorderRadius
                    borderRadius: BorderRadius.circular(_controller.value * 50),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Color/Shape',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),

            // slide transition
            _buildHeader('5. SlideTransition'),
            SizedBox(
              width: 200,
              height: 50,
              child: SlideTransition(
                position: _slideAnimation,
                child: _buildBox(Colors.orange),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper kotak dasar
  Widget _buildBox(Color color) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: const Text('Auto Run', style: TextStyle(color: Colors.white)),
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
}
