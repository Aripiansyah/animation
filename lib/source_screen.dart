// SourceScreen.dart

import 'package:flutter/material.dart';
import 'destination_screen.dart';

// Tag yang sama digunakan di kedua layar
const String heroTag = 'custom-hero';

class SourceScreen extends StatelessWidget {
  const SourceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Layar Asal')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            // Pindah ke Layar Tujuan saat diketuk
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DestinationScreen(),
              ),
            );
          },
          child: Hero(
            tag: heroTag,

            // --- flightShuttleBuilder DITETAPKAN DI SINI ---
            flightShuttleBuilder:
                (
                  flightContext,
                  animation,
                  flightDirection,
                  fromHeroContext,
                  toHeroContext,
                ) {
                  // Menentukan warna awal dan warna akhir
                  final ColorTween colorTween = ColorTween(
                    // Warna awal (misalnya Merah)
                    begin: Colors.red,
                    // Warna akhir (misalnya Hijau)
                    end: Colors.green,
                  );

                  // Widget Hero yang terbang
                  final flyingWidget = fromHeroContext.widget;

                  return AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      // Menggunakan DecoratedBoxTransition untuk mengubah properti BoxDecoration (warna)
                      return DecoratedBoxTransition(
                        // Nilai warna berubah seiring progress animasi
                        decoration: DecorationTween(
                          begin: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          end: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ).animate(animation),

                        // Memastikan child Hero tetap berupa ikon atau teks yang tidak memiliki Decoration
                        child: flyingWidget,
                      );
                    },
                  );
                },
            // ...
            // --- Akhir flightShuttleBuilder ---

            // Widget Anak Hero (sebelum dan sesudah terbang)
            child: Container(
              width: 900,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: const Text(
                  'layar awal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
