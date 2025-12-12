import 'package:flutter/material.dart';
import 'source_page.dart';

class DestinationPage extends StatelessWidget {
  const DestinationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layar Tujuan (Gambar Penuh)'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Hero(
          tag: heroImageTag,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/332A1363.JPG',
              width: 380,
              height: 700,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
