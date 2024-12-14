import 'dart:ui';
import 'package:flutter/material.dart';

class BathStatusScreen extends StatelessWidget {
  const BathStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo con la imagen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo.png'), // Ruta de la imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Efecto de Blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          // Iconos superiores
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Botón para volver al menú
                IconButton(
                  icon: const Icon(Icons.home, size: 30, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context); // Volver al menú
                  },
                ),
                // Ícono de configuración
                IconButton(
                  icon: const Icon(Icons.settings, size: 30, color: Colors.black),
                  onPressed: () {
                    // Mostrar Snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          "Esta funcionalidad estará disponible en una futura versión.",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        backgroundColor: Colors.blue,
                        duration: const Duration(seconds: 2), // Duración del Snackbar
                        action: SnackBarAction(
                          label: "OK",
                          textColor: Colors.white,
                          onPressed: () {
                            // Acción opcional al presionar "OK"
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Contenido principal
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 80),
                const Center(
                  child: Text(
                    "Estado del baño",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        // Nombre de la mascota
                        const Text(
                          "RUFFUS",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Imagen de la mascota
                        Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade200, // Fondo por si no se carga la imagen
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/ruffus.png', // Imagen de la mascota
                              fit: BoxFit.cover, // Ajuste de la imagen
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Text("Imagen no disponible"),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Descripción del estado
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tu peludito ha dejado la sala de espera y se encuentra recibiendo un baño de burbujas.",
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Siguiente paso: secado y corte de uñas.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

